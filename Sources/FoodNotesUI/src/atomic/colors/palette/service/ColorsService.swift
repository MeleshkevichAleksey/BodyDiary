import SwiftUI

public class ColorsService: ObservableObject, Palette, Equatable {
    
    public static func == (lhs: ColorsService, rhs: ColorsService) -> Bool {
        lhs.palette == rhs.palette
    }
    
    
    private static let paletteFoodNotesStorageKey = "ColorsService.PaletteType"
    
    @AppStorage(paletteFoodNotesStorageKey)
    private var storedPalette: PaletteType = .standard
    
    @Published
    public private(set) var palette: PaletteType = .standard
    
    /**
     Change app color schema.
     */
    public func changePalette(type: PaletteType) {
        DispatchQueue.main.async { [weak self] in
            withAnimation(.smooth) {
                self?.setPalette(type)
            }
        }
    }
    
    public init() {
        setPalette(storedPalette)
    }
    
    @Published
    public var textAccent: Color = .clear
    
    @Published
    public var textMain: Color = .clear
    
    @Published
    public var controlMid: Color = .clear
    
    @Published
    public var textAccentControl: Color = .clear
    
    @Published
    public var backgroundMain: Color = .clear
    
    @Published
    public var controlBackgroundAccent: Color = .clear
    
    @Published
    public var controlBackgroundAccentInactive: Color = .clear
    
    @Published
    public var errorBackground: Color = .clear
    
    @Published
    public var groupColor: Color = .clear
    
    @Published
    public var groupControlColor: Color = .clear
    
    @Published
    public var groupControlInversed: Color = .clear
    
    @Published
    public var sectionBackground: Color = .clear
    
    @Published
    public var tintMain: Color = .clear
    
    private func setPalette(_ type: PaletteType) {
        self.storedPalette = type
        self.palette = type
        
        let newPalette: Palette
        
        switch type {
        case .standard:
            newPalette = StandardPalette()
        case .queen:
            newPalette = QueenPalette()
        }
        
        self.textAccent = newPalette.textAccent
        self.textMain = newPalette.textMain
        self.controlMid = newPalette.controlMid
        self.textAccentControl = newPalette.textAccentControl
        self.backgroundMain = newPalette.backgroundMain
        self.controlBackgroundAccent = newPalette.controlBackgroundAccent
        self.controlBackgroundAccentInactive = newPalette.controlBackgroundAccentInactive
        self.errorBackground = newPalette.errorBackground
        self.groupColor = newPalette.groupColor
        self.groupControlColor = newPalette.groupControlColor
        self.groupControlInversed = newPalette.groupControlInversed
        self.sectionBackground = newPalette.sectionBackground
        self.tintMain = newPalette.tintMain
    }
}
