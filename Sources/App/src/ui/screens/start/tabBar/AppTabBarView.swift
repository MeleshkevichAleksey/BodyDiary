import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage

struct AppTabBarView: View {
    
    @StateObject
    private var interfaceService: FoodNotesUIService = DependencyResolver.shared.resolve()
    
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
                if selectedTab == .diary {
                    NotionButton()
                        .frame(height: 70)
                        .transition(
                            AnyTransition.asymmetric(
                                insertion: .offset(y: -20)
                                    .combined(with: .scale(scale: 0.8))
                                    .combined(with: .opacity)
                                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)),
                                removal: .offset(y: 20)
                                    .combined(with: .scale(scale: 0.8))
                                    .combined(with: .opacity)
                                    .animation(.spring(response: 0.2, dampingFraction: 0.6, blendDuration: 0))
                            )
                        )
                        .animation(.spring(), value: selectedTab)
                }
                
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
                .background(interfaceService.colors.groupColor.opacity(TabBarConstants.opacity))
                .clipShape(TabBarShape(addNotionButtonArc: (selectedTab == .diary)))
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
