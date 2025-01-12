import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct SettingsInterfaceView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
                .frame(height: 40)
            
            Text("Settings.Interface.Header")
                .font(uiService.fonts.jostHeadline4)
                .foregroundStyle(uiService.colors.textMain)
            
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
