import SwiftUI
import BodyDiaryKit
import UserInterface

struct AppTabBarView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    var body: some View {
        TabView {
            DiaryView()
                .tabItem {
                    Label("Diary", systemImage: "book")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .tint(interfaceService.colors.textAccent)
        .background(interfaceService.colors.backgroundMain)
    }
}

#Preview {
    AppTabBarView()
}
