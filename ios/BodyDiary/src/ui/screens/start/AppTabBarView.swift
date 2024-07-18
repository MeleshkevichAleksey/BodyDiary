import SwiftUI
import BodyDiaryKit
import UserInterface

struct AppTabBarView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    var body: some View {
        TabView {
            NavigationStack {
                DiaryView()
            }
            .tabItem {
                Label("TabBar.Diary.Title", systemImage: "book")
            }
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("TabBar.Settings.Title", systemImage: "gearshape")
            }
        }
        .tint(interfaceService.colors.textAccent)
        .background(interfaceService.colors.backgroundMain)
    }
}

#Preview {
    AppTabBarView()
        .preferredColorScheme(.dark)
}
