import SwiftUI

public class QueenPalette: Palette {
    
    private static var currentBundle: Bundle {
        return Bundle(for: StandardPalette.self)
    }
    
    private static func bundleColor(_ name: String) -> Color {
        Color(name, bundle: currentBundle)
    }
    
    public var textAccent: Color = bundleColor("BlackPink")
    
    public var textMain: Color = bundleColor("CottonSeed")
    
    public var controlMid: Color = bundleColor("MidGrey")
    
    public var textAccentControl: Color = bundleColor("OuterSpace")
    
    public var backgroundMain: Color = bundleColor("BackgroundMain")
    
    public var controlBackgroundAccent: Color = bundleColor("BlackPink")
    
    public var controlBackgroundAccentInactive: Color = bundleColor("BlackPink").opacity(0.5)
    
    public var errorBackground: Color = bundleColor("ComplementaryRed")
    
    public var groupColor: Color = bundleColor("OuterSpace")
    
    public var groupControlColor: Color = bundleColor("RaisinBlack")
    
    public var groupControlInversed: Color = bundleColor("CottonSeed")
    
    public var sectionBackground: Color = bundleColor("OuterSpace")
    
    public var tintMain: Color = bundleColor("CottonSeed")
}
