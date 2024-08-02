import SwiftUI
import UserInterface
import BodyDiaryKit

/**
 Primary button (main use case on tab bar) to add body notions.
 */
struct NotionButton: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .padding(15)
            .foregroundStyle(interfaceService.colors.controlBackgroundAccent)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(interfaceService.colors.sectionBackground)
            .clipShape(Circle())
    }
}

#Preview {
    NotionButton()
        .frame(width: 60, height: 60)
        .preferredColorScheme(.dark)
}
