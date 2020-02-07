#!/bin/bash

PLATFORM="platform=iOS Simulator,OS=13.0,name=iPhone 11"
SDK="iphonesimulator"

set -e
function trap_handler() {
    echo -e "\n\nFailed to build project"
    exit 255
}
trap trap_handler INT TERM EXIT

echo "Building swift-test."
xcodebuild \
    -project swift-test.xcodeproj \
    -scheme swift-test \
    -sdk "$SDK" \
    -destination "$PLATFORM" \
    build
trap - EXIT
exit 0
