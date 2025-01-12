import SwiftUI
import FoodNotesUI
import FoodNotesKit

struct AppTextFieldStyle: TextFieldStyle {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .foregroundStyle(uiService.colors.textMain)
            .font(uiService.fonts.body1)
            .background(uiService.colors.groupControlColor)
            .clipShape(Capsule())
    }
}

#Preview {
    VStack {
        TextField("Enter your data", text: .constant("Name"))
            .textFieldStyle(AppTextFieldStyle())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
    .preferredColorScheme(.dark)
}
