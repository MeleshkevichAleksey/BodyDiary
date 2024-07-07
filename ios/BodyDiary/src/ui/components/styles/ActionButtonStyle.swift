import SwiftUI
import UserInterface
import BodyDiaryKit

struct ActionButtonStyle: ButtonStyle {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
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
