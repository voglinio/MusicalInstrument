// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MusicalInstrument",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MusicalInstrument",
            targets: ["MusicalInstrument"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/voglinio/MusicSymbol.git", .branch("main")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MusicalInstrument",
            dependencies: ["MusicSymbol"],
            resources: [
                .copy("Resource/SoundFont/GeneralUser_GS_v1_471.sf2"),
                .copy("Resource/SoundFont/LICENSE.txt"),
                .copy("Resource/SoundFont/README.md")
            ]
        ),
        .testTarget(
            name: "MusicalInstrumentTests",
            dependencies: ["MusicalInstrument"]),
    ]
)
