load("@rules_swift_package_manager//swiftpkg:defs.bzl", "swift_package")

# Contents of swift_deps.bzl
def swift_dependencies():
    # version: 4.5.0
    swift_package(
        name = "swiftpkg_lottie_ios",
        commit = "fe4c6fe3a0aa66cdeb51d549623c82ca9704b9a5",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/airbnb/lottie-ios.git",
    )

    # version: 3.1.0
    swift_package(
        name = "swiftpkg_popupview",
        commit = "e0356204053793d63b09eef5e8d87b7108bfd68f",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/exyte/PopupView",
    )

    # version: 1.3.0
    swift_package(
        name = "swiftpkg_swiftui_introspect",
        commit = "807f73ce09a9b9723f12385e592b4e0aaebd3336",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/siteline/swiftui-introspect",
    )
