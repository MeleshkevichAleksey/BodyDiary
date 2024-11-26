// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "FoodNotes",
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.4.2"),
        .package(url: "https://github.com/exyte/PopupView", from: "3.0.0"),
    ]
)
