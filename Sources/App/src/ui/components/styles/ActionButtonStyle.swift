import SwiftUI
import FoodNotesUI
import FoodNotesKit

struct ActionButtonStyle: ButtonStyle {
    
    @StateObject
    private var interfaceService: FoodNotesUIService = DependencyResolver.shared.resolve()
    
    @Binding
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(interfaceService.colors.textAccentControl)
            .background(isSelected ?
                        interfaceService.colors.controlBackgroundAccent :
                            interfaceService.colors.controlBackgroundAccentInactive, in: Capsule())
            .font(interfaceService.fonts.actionButtonTitle)
            .frame(maxWidth: .infinity)
            .onChange(of: interfaceService.colors.palette) { oldValue, newValue in
                isSelected = isSelected
            }
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        Button("Unselected") {
            return
        }
        .buttonStyle(ActionButtonStyle(isSelected: .constant(false)))
        
        Button("Selected") {
            return
        }
        .buttonStyle(ActionButtonStyle(isSelected: .constant(true)))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
    .preferredColorScheme(.dark)
}
