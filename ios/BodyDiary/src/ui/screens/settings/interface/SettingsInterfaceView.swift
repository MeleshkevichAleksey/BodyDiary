import SwiftUI
import BodyDiaryKit
import UserInterface

struct SettingsInterfaceView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Settings.Interface.Header")
                .font(interfaceService.fonts.jostHeadline4)
                .foregroundStyle(interfaceService.colors.textMain)
            
            InterfaceSelectionView()
                .navigationTitle("Settings.Interface.NavigationTitle")
                .navigationBarTitleDisplayMode(.large)
                .toolbarRole(.editor)
        }
    }
}