import SwiftUI
import BodyDiaryKit
import UserInterface

struct StartAppScreen: View {
    
    @StateObject
    private var initializeService = InitializeService()
    
    @Inject
    private var userService: UserService
    
    @State
    private var showAppTabBarView = false
    
    var body: some View {
        Group {
            if initializeService.isInitialized {
                if showAppTabBarView {
                    AppTabBarView()
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
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
