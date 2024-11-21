import SwiftUI
import BodyDiaryUI
import BodyDiaryKit

struct AppTextFieldStyle: TextFieldStyle {
    
    @StateObject
    private var interfaceService: BodyDiaryUIService = DependencyResolver.shared.resolve()
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .foregroundStyle(interfaceService.colors.textMain)
            .font(interfaceService.fonts.body1)
            .background(interfaceService.colors.groupControlColor)
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
