import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct OnboardingInterfaceSelectionView: View {
    
    @StateObject
    private var interfaceService: FoodNotesUIService = DependencyResolver.shared.resolve()
    
    @Binding
    var stepCompleted: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("Onboarding.Page3.SelectionDescription")
                    .font(interfaceService.fonts.body4)
                    .foregroundStyle(interfaceService.colors.textMain)
                    .truncationMode(.middle)
                
                InterfaceSelectionView()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            .background(interfaceService.colors.groupColor)
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
        .environmentObject(FoodNotesUIService())
        .preferredColorScheme(.dark)
}
