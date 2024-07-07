import SwiftUI
import BodyDiaryKit
import UserInterface

struct OnboardingInterfaceSelectionView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    @Binding
    var stepCompleted: Bool
    
    @State
    var selectedPalette: PaletteType = .standard
    
    var body: some View {
        ZStack {
            VStack {
                Text("Onboarding.Page3.SelectionDescription")
                    .font(interfaceService.fonts.body4)
                    .foregroundStyle(interfaceService.colors.textMain)
                    .truncationMode(.middle)
                
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
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            .background(interfaceService.colors.groupColor)
            .clipShape(.buttonBorder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear(perform: {
            stepCompleted = true
            selectedPalette = interfaceService.colors.palette
        })
        .onChange(of: selectedPalette, { oldValue, newValue in
            interfaceService.colors.changePalette(type: newValue)
        })
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OnboardingInterfaceSelectionView(stepCompleted: .constant(true))
        .environmentObject(UserInterfaceService())
        .preferredColorScheme(.dark)
}
