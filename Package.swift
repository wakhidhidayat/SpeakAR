// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "SpeakAR",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "SpeakAR",
            targets: ["AppModule"],
            bundleIdentifier: "com.wahidhidayat.SpeakAR",
            teamIdentifier: "94XJVN3C32",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .mic),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .speechRecognition(purposeString: "You can view a text transcription of your speech in the app."),
                .camera(purposeString: "Place virtual audience using AR"),
                .microphone(purposeString: "Audio is recorded to transcribe speech exercise. Audio recordings are discarded after transcription.")
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/maxxfrazer/FocusEntity", "2.0.0"..<"3.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "FocusEntity", package: "focusentity")
            ],
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)