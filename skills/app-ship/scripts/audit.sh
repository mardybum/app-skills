#!/usr/bin/env bash
# Infrastructure audit of an app repo. Read-only, changes nothing.
# Usage: bash audit.sh <repo-path>
set -uo pipefail

repo="${1:-.}"
cd "$repo" 2>/dev/null || { echo "Folder not found: $repo"; exit 1; }
name="$(basename "$(pwd)")"

ok=0; missing=0
check() { # check "<label>" <condition...>
  local label="$1"; shift
  if "$@" >/dev/null 2>&1; then echo "  ✅ $label"; ok=$((ok + 1)); else echo "  ❌ $label"; missing=$((missing + 1)); fi
}
has_file() { [ -e "$1" ]; }
has_glob() { compgen -G "$1" >/dev/null; }

platform="unknown"
[ -f project.yml ] && platform="iOS (XcodeGen)"
[ -f package.json ] && platform="Web (Node)"

echo "Repo: $name · platform: $platform"
echo
echo "Version control"
check "git repo" git rev-parse --git-dir
check "remote (GitHub)" bash -c 'git remote get-url origin'
check "main is pushed (origin/main = main)" bash -c '[ "$(git rev-parse main 2>/dev/null)" = "$(git rev-parse origin/main 2>/dev/null)" ]'
check "release tags" bash -c '[ -n "$(git tag)" ]'
check "CHANGELOG.md" has_file CHANGELOG.md
check "pre-commit hook" has_file .git/hooks/pre-commit

echo
echo "Quality"
if [ "$platform" = "iOS (XcodeGen)" ]; then
  check "CI (GitHub Actions or Xcode Cloud ci_scripts)" bash -c 'compgen -G ".github/workflows/*.yml" || [ -d ci_scripts ]'
else
  check "CI workflow (.github/workflows)" has_glob ".github/workflows/*.yml"
fi
check "Dependabot" has_file .github/dependabot.yml
if [ "$platform" = "iOS (XcodeGen)" ]; then
  check "SwiftFormat/SwiftLint config" bash -c 'ls -a | grep -qE "^\.(swiftformat|swiftlint\.yml)$"'
  check "unit tests" bash -c 'find . -path ./build -prune -o -name "*Tests.swift" -print | grep -q .'
  check "UI tests" bash -c 'find . -path ./build -prune -o -path "*UITests*" -name "*.swift" -print | grep -q .'
  check "TARGETED_DEVICE_FAMILY in project.yml" grep -q TARGETED_DEVICE_FAMILY project.yml
  check "privacy manifest" bash -c 'find . -path ./build -prune -o -name "PrivacyInfo.xcprivacy" -print | grep -q .'
  check "String Catalog" bash -c 'find . -path ./build -prune -o -name "*.xcstrings" -print | grep -q .'
fi
if [ "$platform" = "Web (Node)" ]; then
  check "ESLint" bash -c 'ls | grep -qE "^(eslint\.config\.|\.eslintrc)"'
  check "tests (vitest/jest/playwright)" grep -qE '"(vitest|jest|@playwright/test)"' package.json
  check "lockfile" bash -c 'ls | grep -qE "^(package-lock\.json|pnpm-lock\.yaml|yarn\.lock)$"'
fi

echo
echo "Config and secrets"
check "no tracked .env files" bash -c '! git ls-files | grep -E "(^|/)\.env(\..+)?$" | grep -vqE "\.env\.example$"'
check "no tracked key files (.p8/.p12/.pem)" bash -c '! git ls-files | grep -qE "\.(p8|p12|pem)$"'
if [ -d supabase ] || [ "$platform" = "Web (Node)" ]; then
  check ".env.example" has_file .env.example
fi
[ -d supabase ] && check "Supabase migrations" has_glob "supabase/migrations/*.sql"

echo
echo "Docs"
check "README.md" has_file README.md
check "CLAUDE.md" has_file CLAUDE.md
check "docs/STATUS.md" has_file docs/STATUS.md
check "DESIGN.md" has_file DESIGN.md

echo
echo "Result: $ok present, $missing missing. Compare with the mode: app-ship/references/infra.md"
