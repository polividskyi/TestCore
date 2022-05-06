#!/bin/bash

   xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/ios.xcarchive" \
    -sdk iphoneos \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/ios_sim.xcarchive" \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO


xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/tv_sim.xcarchive" \
    -sdk appletvsimulator \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/tv.xcarchive" \
    -sdk appletvos \
    SKIP_INSTALL=NO


xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/watch_sim.xcarchive" \
    -sdk watchsimulator \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/watch.xcarchive" \
    -sdk watchos \
    SKIP_INSTALL=NO


xcodebuild archive \
    -scheme CoreDataFramework \
    -archivePath "./build/macos.xcarchive" \
    SKIP_INSTALL=NO


xcodebuild -create-xcframework \
    -framework "./build/ios.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -framework "./build/ios_sim.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -framework "./build/tv.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -framework "./build/tv_sim.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -framework "./build/watch.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -framework "./build/watch_sim.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -framework "./build/macos.xcarchive/Products/Library/Frameworks/CoreDataFramework.framework" \
    -output "./build/CoreDataFramework.xcframework"
