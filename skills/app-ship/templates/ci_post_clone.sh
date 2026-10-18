#!/bin/sh
# Xcode Cloud: save as ci_scripts/ci_post_clone.sh (chmod +x).
# Generates the Xcode project from project.yml before Xcode Cloud builds.
set -e
brew install xcodegen
cd "$CI_PRIMARY_REPOSITORY_PATH"
xcodegen generate
