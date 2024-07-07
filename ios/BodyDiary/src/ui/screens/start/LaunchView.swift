import SwiftUI
import Lottie
import UserInterface
import BodyDiaryKit

struct LaunchView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    var body: some View {
        LottieView(animation: .named("LaunchAnimation"))
            .looping()
            .background(interfaceService.colors.backgroundMain)
    }
}

#Preview {
    LaunchView()
}
