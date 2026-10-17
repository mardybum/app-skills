#!/bin/sh
# Xcode Cloud: als ci_scripts/ci_post_clone.sh ins Repo legen (ausführbar: chmod +x).
# Erzeugt das Xcode-Projekt aus project.yml, bevor Xcode Cloud baut.
set -e
brew install xcodegen
cd "$CI_PRIMARY_REPOSITORY_PATH"
xcodegen generate
