import SwiftUI

public class QueenPalette: Palette {
    
    public var all: [Color] {
        [
            textAccent,
            textMain,
            controlMid,
            textAccentControl,
            backgroundMain,
            controlBackgroundAccent,
            controlBackgroundAccentInactive,
            errorBackground,
            groupColor,
            groupControlColor,
            groupControlInversed,
            sectionBackground,
            tintMain
        ]
    }
    
    private static var currentBundle: Bundle {
        return Bundle(for: StandardPalette.self)
    }
    
    private static func bundleColor(_ name: String) -> Color {
        Color(name, bundle: currentBundle)
    }
    
    public init() {
        
    }
    
    public var textAccent: Color = Colors.blackPink
    
    public var textMain: Color = Colors.cottonSeed
    
    public var controlMid: Color = Colors.midGrey
    
    public var textAccentControl: Color = Colors.outerSpace
    
    public var backgroundMain: Color = Colors.backgroundMain
    
    public var controlBackgroundAccent: Color = Colors.blackPink
    
    public var controlBackgroundAccentInactive: Color = Colors.blackPink.opacity(0.5)
    
    public var errorBackground: Color = Colors.complementaryRed
    
    public var groupColor: Color = Colors.outerSpace
    
    public var groupControlColor: Color = Colors.raisinBlack
    
    public var groupControlInversed: Color = Colors.cottonSeed
    
    public var sectionBackground: Color = Colors.outerSpace
    
    public var tintMain: Color = Colors.cottonSeed
}
