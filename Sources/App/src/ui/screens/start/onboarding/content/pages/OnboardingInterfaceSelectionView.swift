import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct OnboardingInterfaceSelectionView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @Binding
    var stepCompleted: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("Onboarding.Page3.SelectionDescription")
                    .font(uiService.fonts.body4)
                    .foregroundStyle(uiService.colors.textMain)
                    .truncationMode(.middle)
                
                InterfaceSelectionView()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            .background(uiService.colors.groupColor)
            .clipShape(.buttonBorder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear(perform: {
            stepCompleted = true
        })
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OnboardingInterfaceSelectionView(stepCompleted: .constant(true))
        .environmentObject(UIService())
        .preferredColorScheme(.dark)
}
