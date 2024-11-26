load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")

swift_library(
    name = "FoodNotesKit",
    srcs = glob([
        "src/**/*.swift",
    ]),
    module_name = "FoodNotesKit",
    visibility = ["//visibility:public"],
)