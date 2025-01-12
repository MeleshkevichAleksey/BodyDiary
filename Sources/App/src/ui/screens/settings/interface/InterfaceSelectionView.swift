import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct InterfaceSelectionView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @State
    private var selectedPalette: PaletteType = .standard
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image("InterfacePrototype.Standard")
                    .resizable()
                    .frame(width: 98.25, height: 207)
                
                Image(systemName: (selectedPalette == .standard) ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle((selectedPalette == .standard) ? uiService.colors.controlBackgroundAccent :
                                        uiService.colors.groupControlInversed)
                
                Spacer()
                    .frame(height: 10)
                
                Text(PaletteType.standard.rawValue.capitalized)
                    .font(uiService.fonts.body2)
                    .foregroundStyle(uiService.colors.textMain)
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
                    .foregroundStyle((selectedPalette == .queen) ? uiService.colors.controlBackgroundAccent :
                                        uiService.colors.groupControlInversed)
                
                Spacer()
                    .frame(height: 10)
                
                Text(PaletteType.queen.rawValue.capitalized)
                    .font(uiService.fonts.body2)
                    .foregroundStyle(uiService.colors.textMain)
            }
            .onTapGesture {
                selectedPalette = .queen
            }
        }
        .onAppear(perform: {
            selectedPalette = uiService.colors.palette
        })
        .onChange(of: selectedPalette, { oldValue, newValue in
            uiService.colors.changePalette(type: newValue)
        })
    }
}

#Preview {
    InterfaceSelectionView()
        .preferredColorScheme(.dark)
}
