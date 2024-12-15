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
    srcs = glob([
        "src/**/*.swift"
    ]),
    data = glob([
        "PreviewContent",
        "res/LaunchAnimation.json",
        "res/fonts/**",
    ]),
    module_name = "App",
    visibility = ["//visibility:public"],
    deps = [
        "//Sources/FoodNotesKit:FoodNotesKit",
        "//Sources/FoodNotesStorage:FoodNotesStorage",
        "//Sources/FoodNotesUI:FoodNotesUI",
        "@swiftpkg_lottie_ios//:Sources_Lottie",
        "@swiftpkg_popupview//:Sources_PopupView",
        "@swiftpkg_calendarview//:Sources_MijickCalendarView",
    ]
)

filegroup(
    name = "PreviewContent",
    srcs = glob(["res/PreviewContent/**"]),
)

ios_application(
    name = "App",
    app_icons = glob(["res/Assets.xcassets/AppIcon.appiconset/**"]),
    bundle_id = "com.meleshhhkevich.FoodNotes",
    bundle_name = "FoodNotes",
    entitlements = "FoodNotes.entitlements",
    executable_name = "FoodNotes",
    families = ["iphone", "ipad"],
    provisioning_profile = ":xcode_profile",
    infoplists = [":Info.plist"],
    minimum_os_version = app_config.minimum_ios_version,
    resources = glob(
        [
            "res/Assets.xcassets/**",
        ],
        exclude = ["res/Assets.xcassets/AppIcon.appiconset/**"],
    ),
    strings = glob(["res/*.strings"]),
    version = ":Version",
    visibility = ["//visibility:public"],
    deps = [
        ":app.library",
    ],
)

xcode_provisioning_profile(
   name = "xcode_profile",
   managed_by_xcode = True,
   provisioning_profile = ":provisioning_profile",
)

local_provisioning_profile(
    name = "provisioning_profile",
    profile_name = "iOS Team Provisioning Profile: com.meleshhhkevich.FoodNotes",
    team_id = "WD3HSGX563",
)