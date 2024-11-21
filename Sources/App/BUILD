load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_apple//apple:versioning.bzl", "apple_bundle_version")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("//configuration:configuration.bzl", "app_config")
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "xcodeproj",
    "xcode_provisioning_profile"
)
load("@build_bazel_rules_apple//apple:apple.bzl", "local_provisioning_profile")

apple_bundle_version(
    name = "Version",
    build_version = "0.0.1",
    short_version_string = "1.0",
)

# gazelle:swift_default_module_name app.library

swift_library(
    name = "app.library",
    srcs = glob(["src/**/*.swift"]),
    data = [":PreviewContent"],
    module_name = "App",
    visibility = ["//visibility:public"],
    deps = [
        "//Sources/BodyDiaryKit:BodyDiaryKit",
        "//Sources/BodyDiaryStorage:BodyDiaryStorage",
        "//Sources/BodyDiaryUI:BodyDiaryUI",
        "@swiftpkg_lottie_ios//:Sources_Lottie",
        "@swiftpkg_popupview//:Sources_PopupView",
    ]
)

local_provisioning_profile(
    name = "xcode_managed_profile",
    profile_name = "iOS Team Provisioning Profile: com.meleshhhkevich.BodyDiary",
    tags = ["manual"],
)

ios_application(
    name = "App",
    app_icons = glob(["Assets/Assets.xcassets/AppIcon.appiconset/**"]),
    bundle_id = "com.meleshhhkevich.BodyDiary",
    bundle_name = "BodyDiary",
    entitlements = "BodyDiary.entitlements",
    executable_name = "BodyDiary",
    families = ["iphone", "ipad"],
    infoplists = [":Info.plist"],
    minimum_os_version = app_config.minimum_ios_version,
    resources = glob(["Assets/Assets.xcassets/**"]),
    strings = glob(["*.xcstrings"]),
    version = ":Version",
    visibility = ["//visibility:public"],
    deps = [
        ":app.library",
    ],
)