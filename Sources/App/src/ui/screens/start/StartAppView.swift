import SwiftUI
import FoodNotesKit
import FoodNotesUI

struct StartAppScreen: View {
    
    @StateObject
    private var initializeService = InitializeService()
    
    @StateObject
    private var userService: UserService = DependencyContainer.shared.resolve()
    
    @Inject
    private var appConfigurationProvider: AppConfigurationProvider
    
    @State
    private var showAppTabBarView = false
    
    var body: some View {
        Group {
            if initializeService.isInitialized {
                if showAppTabBarView {
                    AppTabBarView()
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                else {
                    OnboardingView(viewModel: OnboardingViewModel())
                        .transition(.move(edge: .leading).combined(with: .opacity))
                }
            } else {
                LaunchView()
            }
        }
        .onAppear {
            showAppTabBarView = userService.isOnboardingCompleted
        }
        .onChange(of: userService.isOnboardingCompleted, { oldValue, newValue in
            showAppTabBarView = true
        })
        .animation(.easeInOut(duration: 1.0), value: showAppTabBarView)
    }
}

#Preview {
    StartAppScreen()
}
