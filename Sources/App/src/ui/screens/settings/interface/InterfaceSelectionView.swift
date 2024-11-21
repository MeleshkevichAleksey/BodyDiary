import SwiftUI
import BodyDiaryKit
import BodyDiaryUI

struct InterfaceSelectionView: View {
    
    @StateObject
    private var interfaceService: BodyDiaryUIService = DependencyResolver.shared.resolve()
    
    @State
    private var selectedPalette: PaletteType = .standard
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image("InterfacePrototype.Standard")
                    .resizable()
                    .frame(width: 98.25, height: 207)
                
                Image(systemName: (selectedPalette == .standard) ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle((selectedPalette == .standard) ? interfaceService.colors.controlBackgroundAccent :
                                        interfaceService.colors.groupControlInversed)
                
                Spacer()
                    .frame(height: 10)
                
                Text(PaletteType.standard.rawValue.capitalized)
                    .font(interfaceService.fonts.body2)
                    .foregroundStyle(interfaceService.colors.textMain)
            }
            .onTapGesture {
                selectedPalette = .standard
            }
            
            Spacer()
                .frame(width: 40)
            
            VStack(alignment: .center) {
                Image("InterfacePrototype.Queen")
                    .resizable()
                    .frame(width: 98.25, height: 207)
                
                Image(systemName: (selectedPalette == .queen) ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle((selectedPalette == .queen) ? interfaceService.colors.controlBackgroundAccent :
                                        interfaceService.colors.groupControlInversed)
                
                Spacer()
                    .frame(height: 10)
                
                Text(PaletteType.queen.rawValue.capitalized)
                    .font(interfaceService.fonts.body2)
                    .foregroundStyle(interfaceService.colors.textMain)
            }
            .onTapGesture {
                selectedPalette = .queen
            }
        }
        .onAppear(perform: {
            selectedPalette = interfaceService.colors.palette
        })
        .onChange(of: selectedPalette, { oldValue, newValue in
            interfaceService.colors.changePalette(type: newValue)
        })
    }
}

#Preview {
    InterfaceSelectionView()
        .preferredColorScheme(.dark)
}
