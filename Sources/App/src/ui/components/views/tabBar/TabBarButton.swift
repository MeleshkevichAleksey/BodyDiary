import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct TabBarButton: View {
    
    @StateObject
    private var interfaceService: UIService = DependencyContainer.shared.resolve()
    
    @Binding
    var isSelected: Bool
    
    let item: TabBarButtonItem
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: item.image)
                .foregroundStyle(isSelected ? interfaceService.colors.textMain : interfaceService.colors.controlMid)
            
            Text(LocalizedStringKey(item.title))
                .font(interfaceService.fonts.body1Medium)
                .foregroundStyle(isSelected ? interfaceService.colors.textMain : interfaceService.colors.controlMid)
        }
    }
}

#Preview {
    TabBarButton(isSelected: .constant(true),
                 item: TabBarButtonItemProvider().provideItem(for: .notes))
        .preferredColorScheme(.dark)
}
