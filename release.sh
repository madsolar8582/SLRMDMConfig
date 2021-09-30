#!/usr/bin/env bash
# This script builds and packages the project for release
# Lint with https://www.shellcheck.net/ when making changes
set -Eeuo pipefail

if [[ -d "build" ]]; then
  echo -e "\nRemoving existing build folder"
  rm -rfv "build"
fi

echo -e "\nBuilding the frameworks for distribution"
echo -e "\nBuilding iOS Device"
xcodebuild clean archive -project SLRMDMConfig.xcodeproj -scheme SLRMDMConfig -configuration Release -destination generic/platform=iOS -sdk iphoneos -archivePath build/archives/ios.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES ENABLE_BITCODE=YES
echo -e "\nBuilding iOS Simulator"
xcodebuild clean archive -project SLRMDMConfig.xcodeproj -scheme SLRMDMConfig -configuration Release -destination generic/platform=iOS\ Simulator -sdk iphonesimulator -archivePath build/archives/ios-sim.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
echo -e "\nBuilding Mac Catalyst"
xcodebuild clean archive -project SLRMDMConfig.xcodeproj -scheme SLRMDMConfig -configuration Release -destination 'platform=macOS,variant=Mac Catalyst' -archivePath build/archives/ios-cat.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
echo -e "\nBuilding macOS"
xcodebuild clean archive -project SLRMDMConfig.xcodeproj -scheme SLRMDMConfig -configuration Release -destination 'generic/platform=macOS,name=Any Mac' -archivePath build/archives/mac.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
echo -e "\nBuilding tvOS Device"
xcodebuild clean archive -project SLRMDMConfig.xcodeproj -scheme SLRMDMConfig -configuration Release -destination generic/platform=tvOS -archivePath build/archives/tvos.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES ENABLE_BITCODE=YES
echo -e "\nBuilding tvOS Simulator"
xcodebuild clean archive -project SLRMDMConfig.xcodeproj -scheme SLRMDMConfig -configuration Release -destination generic/platform=tvOS\ Simulator -archivePath build/archives/tvos-sim.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

iOSBCMaps=()
tvBCMaps=()

echo -e "\nFinding iOS Bitcode Symbol Maps"
while IFS= read -d '' -r filename; do
    iOSBCMaps+=("$filename")
done < <(find "$(pwd -P)"/build/archives -path "*ios*" -name "*.bcsymbolmap" -print0)

echo -e "\nFinding tvOS Bitcode Symbol Maps"
while IFS= read -d '' -r filename; do
    tvBCMaps+=("$filename")
done < <(find "$(pwd -P)"/build/archives -path "*tv*" -name "*.bcsymbolmap" -print0)

set +u
iOSBCMapCount=${#iOSBCMaps[@]}
tvBCMapCount=${#tvBCMaps[@]}
set -u

iOSDebugSymbols=""
tvDebugSymbols=""

echo -e "\nGenerating iOS Bitcode Symbol Map command"
for ((i=0;i<iOSBCMapCount;i++)); do
  iOSDebugSymbols+=" -debug-symbols ${iOSBCMaps[i]}"
done

echo -e "\nGenerating tvOS Bitcode Symbol Map command"
for ((i=0;i<tvBCMapCount;i++)); do
  tvDebugSymbols+=" -debug-symbols ${tvBCMaps[i]}"
done

echo -e "\nCreating XCFramework"
# shellcheck disable=SC2086
xcodebuild -create-xcframework -framework build/archives/ios.xcarchive/Products/Library/Frameworks/SLRMDMConfig.framework \
-debug-symbols "$(pwd -P)"/build/archives/ios.xcarchive/dSYMs/SLRMDMConfig.framework.dSYM \
$iOSDebugSymbols \
-framework build/archives/ios-sim.xcarchive/Products/Library/Frameworks/SLRMDMConfig.framework \
-debug-symbols "$(pwd -P)"/build/archives/ios-sim.xcarchive/dSYMs/SLRMDMConfig.framework.dSYM \
-framework build/archives/ios-cat.xcarchive/Products/Library/Frameworks/SLRMDMConfig.framework \
-debug-symbols "$(pwd -P)"/build/archives/ios-cat.xcarchive/dSYMs/SLRMDMConfig.framework.dSYM \
-framework build/archives/mac.xcarchive/Products/Library/Frameworks/SLRMDMConfig.framework \
-debug-symbols "$(pwd -P)"/build/archives/mac.xcarchive/dSYMs/SLRMDMConfig.framework.dSYM \
-framework build/archives/tvos.xcarchive/Products/Library/Frameworks/SLRMDMConfig.framework \
-debug-symbols "$(pwd -P)"/build/archives/tvos.xcarchive/dSYMs/SLRMDMConfig.framework.dSYM \
$tvDebugSymbols \
-framework build/archives/tvos-sim.xcarchive/Products/Library/Frameworks/SLRMDMConfig.framework \
-debug-symbols "$(pwd -P)"/build/archives/tvos-sim.xcarchive/dSYMs/SLRMDMConfig.framework.dSYM \
-output build/framework/SLRMDMConfig.xcframework

echo -e "\nCreating ZIP archive"
rootDirectory="$PWD"
cd build/framework/
zip -r -o SLRMDMConfig.zip .
mv SLRMDMConfig.zip "$rootDirectory"
cd "$rootDirectory"

echo -e "\nRelease Complete"
