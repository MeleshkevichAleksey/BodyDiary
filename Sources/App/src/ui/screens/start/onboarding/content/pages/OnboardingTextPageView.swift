import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct OnboardingTextPageView: View {
    
    @StateObject
    private var interfaceService: FoodNotesUIService = DependencyResolver.shared.resolve()
    
    @Binding
    var stepCompleted: Bool
    
    let text: String
    
    var body: some View {
        ZStack {
            VStack {
                Text(LocalizedStringKey(text))
                    .font(interfaceService.fonts.body4)
                    .foregroundStyle(interfaceService.colors.textMain)
                    .truncationMode(.middle)
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
    }
}

#Preview {
    OnboardingTextPageView(stepCompleted: .constant(true),
                           text: "Onboarding.Page1.Text")
    .preferredColorScheme(.dark)
}
