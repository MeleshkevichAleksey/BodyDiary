import SwiftUI

struct Colors {
    
    public static let blackPink: Color = Color(rgb: 0xB33B72)
    
    public static let paleLime: Color = Color(rgb: 0xD5FF5F)
    
    public static let cottonSeed: Color = Color(rgb: 0xF3F3F3)
    
    public static let midGrey: Color = Color(rgb: 0x656566)
    
    public static let outerSpace: Color = Color(rgb: 0x2D2D36)
    
    public static let backgroundMain: Color = Color(rgb: 0x000000)
    
    public static let complementaryRed: Color = Color(rgb: 0xFF4D4D)
    
    public static let raisinBlack: Color = Color(rgb: 0x1E1E25)
}

#Preview {
    VStack {
        ZStack {
            Colors.blackPink
            Text("blackPink")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.paleLime
            Text("paleLime")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.cottonSeed
            Text("cottonSeed")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.midGrey
            Text("midGrey")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.outerSpace
            Text("outerSpace")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.backgroundMain
            Text("backgroundMain")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.complementaryRed
            Text("complementaryRed")
                .foregroundStyle(Color.cyan)
        }
        ZStack {
            Colors.raisinBlack
            Text("raisinBlack")
                .foregroundStyle(Color.cyan)
        }
    }
    .preferredColorScheme(.dark)
}
