import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage

struct AppTabBarView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
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
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            
            VStack(spacing: -35) {
                HStack() {
                    ForEach(tabs, id: \.self) { tab in
                        Spacer()
                        TabBarButton(isSelected: .constant(selectedTab == tab),
                                     item: TabBarButtonItemProvider().provideItem(for: tab))
                        .onTapGesture {
                            withAnimation {
                                selectedTab = tab
                            }
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(uiService.colors.groupColor.opacity(TabBarConstants.opacity))
                .clipShape(TabBarShape())
                .padding(.horizontal, 30)
            }
        }
        .tint(uiService.colors.textAccent)
        .background(uiService.colors.backgroundMain)
    }
    
    @ViewBuilder
    private func tabUnitView(for unit: AppTabBarUnit) -> some View {
        switch unit {
        case .notes:
            NotesView(viewModel: NotesViewModel())
        case .settings:
            SettingsView()
        }
    }
}

#Preview {
    AppTabBarView()
        .preferredColorScheme(.dark)
}
