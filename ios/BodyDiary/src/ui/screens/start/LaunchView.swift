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
            .configure({ lottieView in
                let colorValueProvider = ColorValueProvider(interfaceService.colors.controlBackgroundAccent.uiColor.lottieColorValue)
                
                let keyPaths = [
                    "sweap 2.Shape 1.Stroke 1.Color",
                    "sweap.Shape 1.Stroke 1.Color",
                    "wait - 1.Group 1.Fill 1.Color",
                    "wait - 3.Group 2.Fill 1.Color",
                    "wait - 3.Group 1.Fill 1.Color"
                ]
                
                keyPaths.forEach { keyPath in
                    lottieView.setValueProvider(colorValueProvider, keypath: AnimationKeypath(keypath: keyPath))
                }
            })
            .background(interfaceService.colors.backgroundMain)
    }
}

#Preview {
    LaunchView()
        .preferredColorScheme(.dark)
}
