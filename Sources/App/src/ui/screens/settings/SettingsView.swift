import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage
import SwiftData

struct SettingsView: View {
    
    @Inject
    private var logger: Logger
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var userEntities: [UserEntity]
    
    @State
    private var userName: String = String()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    UserAvatarView()
                    
                    Text("Settings.User.Greetings \(userName)")
                        .font(uiService.fonts.jostHeadline4)
                        .foregroundStyle(uiService.colors.textMain)
                    
                    Spacer()
                }
                .padding(.vertical, 28)
                
                HStack {
                    VStack(alignment: .leading, spacing: 28) {
                        SectionSegueView(image: Image(systemName: "person.fill"),
                                         title: "Settings.PersonalData.Title")
                        
                        NavigationLink {
                            SettingsInterfaceView()
                        } label: {
                            SectionSegueView(image: Image(systemName: "paintpalette.fill"),
                                             title: "Settings.Appearance.Title")
                        }
                        
                        SectionSegueView(image: Image(systemName: "questionmark.circle.fill"),
                                         title: "Settings.Help.Title")
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 20)
                .padding(.leading, 20)
                .background(uiService.colors.sectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
        }
        .padding(.horizontal, 46)
        .background(uiService.colors.backgroundMain)
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
