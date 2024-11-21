import SwiftUI
import BodyDiaryKit
import BodyDiaryUI

struct SettingsInterfaceView: View {
    
    @StateObject
    private var interfaceService: BodyDiaryUIService = DependencyResolver.shared.resolve()
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
                .frame(height: 40)
            
            Text("Settings.Interface.Header")
                .font(interfaceService.fonts.jostHeadline4)
                .foregroundStyle(interfaceService.colors.textMain)
            
            InterfaceSelectionView()
                .navigationTitle("Settings.Interface.NavigationTitle")
                .navigationBarTitleDisplayMode(.large)
                .toolbarRole(.editor)
            
            Spacer()
        }
    }
}

#Preview {
    SettingsInterfaceView()
        .preferredColorScheme(.dark)
}
