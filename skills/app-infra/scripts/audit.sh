#!/usr/bin/env bash
# Infrastruktur-Bestandsaufnahme eines App-Repos. Liest nur, ändert nichts.
# Aufruf: bash audit.sh <repo-pfad>
set -uo pipefail

repo="${1:-.}"
cd "$repo" 2>/dev/null || { echo "Ordner nicht gefunden: $repo"; exit 1; }
name="$(basename "$(pwd)")"

ok=0; missing=0
check() { # check "<Beschreibung>" <bedingung...>
  local label="$1"; shift
  if "$@" >/dev/null 2>&1; then echo "  ✅ $label"; ok=$((ok + 1)); else echo "  ❌ $label"; missing=$((missing + 1)); fi
}
has_file() { [ -e "$1" ]; }
has_glob() { compgen -G "$1" >/dev/null; }
tracked() { git ls-files --error-unmatch "$1" >/dev/null 2>&1; }

platform="unbekannt"
[ -f project.yml ] && platform="iOS (XcodeGen)"
[ -f package.json ] && platform="Web (Node)"

echo "Repo: $name · Plattform: $platform"
echo
echo "Versionskontrolle"
check "Git-Repo" git rev-parse --git-dir
check "Remote (GitHub)" bash -c 'git remote get-url origin'
check "main ist gepusht (origin/main = main)" bash -c '[ "$(git rev-parse main 2>/dev/null)" = "$(git rev-parse origin/main 2>/dev/null)" ]'
check "Release-Tags" bash -c '[ -n "$(git tag)" ]'
check "CHANGELOG.md" has_file CHANGELOG.md
check "Pre-Commit-Hook" has_file .git/hooks/pre-commit

echo
echo "Qualität"
if [ "$platform" = "iOS (XcodeGen)" ]; then
  check "CI (GitHub Actions oder Xcode Cloud ci_scripts)" bash -c 'compgen -G ".github/workflows/*.yml" || [ -d ci_scripts ]'
else
  check "CI-Workflow (.github/workflows)" has_glob ".github/workflows/*.yml"
fi
check "Dependabot" has_file .github/dependabot.yml
if [ "$platform" = "iOS (XcodeGen)" ]; then
  check "SwiftFormat/SwiftLint-Konfiguration" bash -c 'ls -a | grep -qE "^\.(swiftformat|swiftlint\.yml)$"'
  check "Unit-Tests" bash -c 'find . -path ./build -prune -o -name "*Tests.swift" -print | grep -q .'
  check "UI-Tests" bash -c 'find . -path ./build -prune -o -path "*UITests*" -name "*.swift" -print | grep -q .'
  check "TARGETED_DEVICE_FAMILY in project.yml" grep -q TARGETED_DEVICE_FAMILY project.yml
  check "Privacy Manifest" bash -c 'find . -path ./build -prune -o -name "PrivacyInfo.xcprivacy" -print | grep -q .'
  check "String Catalog" bash -c 'find . -path ./build -prune -o -name "*.xcstrings" -print | grep -q .'
fi
if [ "$platform" = "Web (Node)" ]; then
  check "ESLint" bash -c 'ls | grep -qE "^(eslint\.config\.|\.eslintrc)"'
  check "Tests (vitest/jest/playwright)" grep -qE '"(vitest|jest|@playwright/test)"' package.json
  check "Lockfile" bash -c 'ls | grep -qE "^(package-lock\.json|pnpm-lock\.yaml|yarn\.lock)$"'
fi

echo
echo "Konfiguration und Secrets"
check "keine getrackten .env-Dateien" bash -c '! git ls-files | grep -E "(^|/)\.env(\..+)?$" | grep -vqE "\.env\.example$"'
check "keine getrackten Schlüsseldateien (.p8/.p12/.pem)" bash -c '! git ls-files | grep -qE "\.(p8|p12|pem)$"'
if [ -d supabase ] || [ "$platform" = "Web (Node)" ]; then
  check ".env.example" has_file .env.example
fi
[ -d supabase ] && check "Supabase-Migrationen" has_glob "supabase/migrations/*.sql"

echo
echo "Dokumentation"
check "README.md" has_file README.md
check "CLAUDE.md" has_file CLAUDE.md
check "docs/STATUS.md" has_file docs/STATUS.md
check "DESIGN.md" has_file DESIGN.md

echo
echo "Ergebnis: $ok vorhanden, $missing fehlen."
echo "Abgleich mit dem Modus: app-infra/references/best-practices.md"
