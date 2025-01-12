import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct SectionSegueView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    let image: Image
    
    let title: String
    
    let action: (() -> Void)?
    
    init(image: Image, title: String, action: (() -> Void)? = nil) {
        self.image = image
        self.title = title
        self.action = action
    }
    
    var body: some View {
        HStack(spacing: 16) {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(uiService.colors.tintMain)
            
            Text(LocalizedStringKey(title))
                .foregroundStyle(uiService.colors.textMain)
                .font(uiService.fonts.body2)
                .lineLimit(1)
        }
    }
}

#Preview {
    SectionSegueView(image: Image(systemName: "paintpalette.fill"),
                     title: "Settings.Appearence.Title")
    .preferredColorScheme(.dark)
}
