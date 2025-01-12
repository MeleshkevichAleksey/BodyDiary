import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct OnboardingTextPageView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @Binding
    var stepCompleted: Bool
    
    let text: String
    
    var body: some View {
        ZStack {
            VStack {
                Text(LocalizedStringKey(text))
                    .font(uiService.fonts.body4)
                    .foregroundStyle(uiService.colors.textMain)
                    .truncationMode(.middle)
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
    }
}

#Preview {
    OnboardingTextPageView(stepCompleted: .constant(true),
                           text: "Onboarding.Page1.Text")
    .preferredColorScheme(.dark)
}
