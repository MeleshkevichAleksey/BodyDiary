import SwiftUI

public protocol Palette {
    
    var textAccent: Color { get set }
    
    var textMain: Color { get set }
    
    var textAccentControl: Color { get set }
    
    var backgroundMain: Color { get set }
    
    var controlBackgroundAccent: Color { get set }
    
    var controlBackgroundAccentInactive: Color { get set }
    
    var errorBackground: Color { get set }
    
    var groupColor: Color { get set }
    
    var groupControlColor: Color { get set }
    
    var groupControlInversed: Color { get set }
}
