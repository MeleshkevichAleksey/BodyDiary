import SwiftUI

public class StandardPalette: Palette {
    
    private static var currentBundle: Bundle {
        return Bundle(for: StandardPalette.self)
    }
    
    private static func bundleColor(_ name: String) -> Color {
        Color(name, bundle: currentBundle)
    }
    
    public var textAccent: Color = bundleColor("PaleLime")
    
    public var textMain: Color = bundleColor("CottonSeed")
    
    public var textAccentControl: Color = bundleColor("OuterSpace")
    
    public var backgroundMain: Color = bundleColor("BackgroundMain")
    
    public var controlBackgroundAccent: Color = bundleColor("PaleLime")
    
    public var controlBackgroundAccentInactive: Color = bundleColor("PaleLime").opacity(0.5)
    
    public var errorBackground: Color = bundleColor("ComplementaryRed")
    
    public var groupColor: Color = bundleColor("OuterSpace")
    
    public var groupControlColor: Color = bundleColor("RaisinBlack")
    
    public var groupControlInversed: Color = bundleColor("CottonSeed")
}
