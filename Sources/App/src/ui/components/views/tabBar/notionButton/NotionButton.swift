import SwiftUI
import FoodNotesUI
import FoodNotesKit

/**
 Primary button (main use case on tab bar) to add body notions.
 */
struct NotionButton: View {
    
    @StateObject
    private var interfaceService: FoodNotesUIService = DependencyResolver.shared.resolve()
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "plus")
                .scaleEffect(CGSize(width: 3, height: 3))
                .padding(23)
        })
            .foregroundStyle(interfaceService.colors.controlBackgroundAccent)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(interfaceService.colors.groupColor.opacity(TabBarConstants.opacity))
            .clipShape(Circle())
    }
}

#Preview {
    AppTabBarView()
        .preferredColorScheme(.dark)
}
