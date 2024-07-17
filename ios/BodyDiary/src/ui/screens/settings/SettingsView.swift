import SwiftUI
import BodyDiaryKit
import UserInterface
import Storage
import SwiftData

struct SettingsView: View {
    
    @Inject
    private var logger: Logger
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var userEntities: [UserEntity]
    
    @State
    private var userName: String = String()
    
    var body: some View {
        VStack {
            HStack {
                UserAvatarView()
                
                Text("Settings.User.Greetings \(userName)")
                    .font(interfaceService.fonts.jostHeadline4)
                    .foregroundStyle(interfaceService.colors.textMain)
                
                Spacer()
            }
            .padding(.leading, 40)
            
            Spacer()
        }
        .background(interfaceService.colors.backgroundMain)
        .onAppear(perform: {
            bindUser()
        })
    }
    
    private func bindUser() {
        if let user = userEntities.first {
            userName = user.name
        }
        else {
            logger.log(message: "User not found", type: .error)
        }
    }
}

#Preview {
    return SettingsView()
        .preferredColorScheme(.dark)
        .modelContainer(PreviewDataContainer.previewContainer)
}
