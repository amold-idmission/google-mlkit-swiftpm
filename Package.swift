// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "GoogleMLKitSwiftPM",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "MLKitTextRecognition", targets: ["MLKitTextRecognition", "MLKitTextRecognitionCommon", "MLImage", "MLKitVision", "Common"]),
  ],
  dependencies: [
    .package(url: "https://github.com/google/promises.git", exact: "2.4.0"),
    .package(url: "https://github.com/google/GoogleDataTransport.git", exact: "10.1.0"),
    .package(url: "https://github.com/google/GoogleUtilities.git", exact: "8.1.0"),
    .package(url: "https://github.com/google/gtm-session-fetcher.git", exact: "3.5.0"),
    .package(url: "https://github.com/firebase/nanopb.git", exact: "2.30910.0"),
  ],
  targets: [
    .binaryTarget(
      name: "MLKitTextRecognition",
      url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0-1/MLKitTextRecognition.xcframework.zip",
      checksum: "1f20493b54611a251cae278fd9f206c3009eee3de7091e5e4f1cb1a050526f72"),
    .binaryTarget(
      name: "MLKitTextRecognitionCommon",
      url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0-1/MLKitTextRecognitionCommon.xcframework.zip",
      checksum: "9b6cbfd695e5458e5ccab905d2c6a641cd29fe60a6ec4fd8acb62ef9b8ac91e7"),
    .binaryTarget(
      name: "MLImage",
      url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0-1/MLImage.xcframework.zip",
      checksum: "ed3a23f4f5bf4c1f461337311a29dd12a3d01676dd49ea06b9b21cab223159f5"),
    .binaryTarget(
      name: "MLKitVision",
      url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0-1/MLKitVision.xcframework.zip",
      checksum: "b26f8c96d1e12515b990fca0b2237d60363d7bddc925d5ec61d7ee7d8b5e83c3"),
    .binaryTarget(
      name: "MLKitCommon",
      url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0-1/MLKitCommon.xcframework.zip",
      checksum: "0c3523adc6248b5fd7e71c5af1c3e028a2ffcd20ca6add03283e20a09740f43f"),
    // ──────────────────────────────────────────────────────
    // GoogleToolboxForMac – source target
    // The pod’s public headers live in the target root, so we set
    // publicHeadersPath: "." to satisfy SPM’s requirement.
    // ──────────────────────────────────────────────────────
    .target(
        name: "GoogleToolboxForMac",
        path: "Pods/GoogleToolboxForMac",
        publicHeadersPath: ".",
        cSettings: [.unsafeFlags(["-fno-objc-arc"])]
    ),
    .target(
      name: "Common",
      dependencies: [
        "MLKitCommon",
        "GoogleToolboxForMac",
        .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
        .product(name: "GULEnvironment", package: "GoogleUtilities"),
        .product(name: "GULLogger", package: "GoogleUtilities"),
        .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
        .product(name: "GULNSData", package: "GoogleUtilities"),
        .product(name: "GULNetwork", package: "GoogleUtilities"),
        .product(name: "GULReachability", package: "GoogleUtilities"),
        .product(name: "GULUserDefaults", package: "GoogleUtilities"),
        .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
        .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
        .product(name: "nanopb", package: "nanopb"),
        .product(name: "FBLPromises", package: "promises"),
      ]),
  ]
)
