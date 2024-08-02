import SwiftUI
import BodyDiaryKit
import UserInterface
import Storage

struct AppTabBarView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    @Inject
    private var appConfigurationProvider: AppConfigurationProvider
    
    @Inject
    private var logger: Logger
    
    @State
    private var selectedTab: AppTabBarUnit
    
    private var tabs: [AppTabBarUnit] {
        appConfigurationProvider.config.tabs.units
    }
    
    init() {
        self.selectedTab = _appConfigurationProvider.wrappedValue.config.tabs.initialTab
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: .init(get: {
                selectedTab.id
            },
                                     set: { id in
                guard let tab = AppTabBarUnit(rawValue: id) else {
                    AppTerminationHandler.execute(message: "Cound not create AppTabBarUnit from id: \(id)")
                }
                selectedTab = tab
            })) {
                ForEach(tabs) { tab in
                    NavigationStack {
                        tabUnitView(for: tab)
                            .tag(tab.id)
                    }
                }
            }
            
            VStack(spacing: -35) {
                NotionButton()
                    .frame(height: 70)
                
                HStack {
                    ForEach(tabs, id: \.self) { image in
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(interfaceService.colors.groupColor.opacity(0.7))
                .clipShape(TabBarShape(addNotionButtonArc: true))
                .padding(.horizontal, 30)
            }
        }
        .tint(interfaceService.colors.textAccent)
        .background(interfaceService.colors.backgroundMain)
    }
    
    @ViewBuilder
    private func tabUnitView(for unit: AppTabBarUnit) -> some View {
        switch unit {
        case .diary:
            DiaryView()
        case .settings:
            SettingsView()
        }
    }
}

#Preview {
    AppTabBarView()
        .preferredColorScheme(.dark)
}
