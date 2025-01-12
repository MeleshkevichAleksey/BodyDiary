import SwiftUI
import FoodNotesUI
import FoodNotesKit

struct ActionButtonStyle: ButtonStyle {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @Binding
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(uiService.colors.textAccentControl)
            .background(isSelected ?
                        uiService.colors.controlBackgroundAccent :
                            uiService.colors.controlBackgroundAccentInactive, in: Capsule())
            .font(uiService.fonts.actionButtonTitle)
            .frame(maxWidth: .infinity)
            .onChange(of: uiService.colors.palette) { oldValue, newValue in
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
