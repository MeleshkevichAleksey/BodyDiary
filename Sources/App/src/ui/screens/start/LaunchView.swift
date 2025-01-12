import SwiftUI
import Lottie
import FoodNotesUI
import FoodNotesKit

struct LaunchView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    var body: some View {
        LottieView(animation: .named("LaunchAnimation"))
            .looping()
            .configure({ lottieView in
                let colorValueProvider = ColorValueProvider(uiService.colors.controlBackgroundAccent.uiColor.lottieColorValue)
                
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
            .background(uiService.colors.backgroundMain)
    }
}

#Preview {
    LaunchView()
        .preferredColorScheme(.dark)
}
