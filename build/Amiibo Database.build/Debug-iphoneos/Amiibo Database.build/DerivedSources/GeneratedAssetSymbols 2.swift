import Foundation
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "Mario" asset catalog image resource.
    static let mario = DeveloperToolsSupport.ImageResource(name: "Mario", bundle: resourceBundle)

    /// The "au" asset catalog image resource.
    static let au = DeveloperToolsSupport.ImageResource(name: "au", bundle: resourceBundle)

    /// The "eu" asset catalog image resource.
    static let eu = DeveloperToolsSupport.ImageResource(name: "eu", bundle: resourceBundle)

    /// The "jp" asset catalog image resource.
    static let jp = DeveloperToolsSupport.ImageResource(name: "jp", bundle: resourceBundle)

    /// The "na" asset catalog image resource.
    static let na = DeveloperToolsSupport.ImageResource(name: "na", bundle: resourceBundle)

}

