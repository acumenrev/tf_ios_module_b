// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tf_ios_module_b",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "tf_ios_module_b",
            targets: ["tf_ios_module_b"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxFlow.git", from: "2.10.0"),
        .package(url: "https://github.com/acumenrev/tf_ios_app_flows", branch: "master"),
        .package(url: "https://github.com/AliSoftware/Reusable.git", from: "4.1.0"),
        .package(url: "https://github.com/devxoul/URLNavigator", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "tf_ios_module_b",
            dependencies: ["RxFlow", "tf_ios_app_flows", "Reusable", "URLNavigator"]),
        .testTarget(
            name: "tf_ios_module_bTests",
            dependencies: ["tf_ios_module_b"]),
    ]
)
