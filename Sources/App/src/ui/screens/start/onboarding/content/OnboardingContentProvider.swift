import SwiftUI
import BodyDiaryKit

/**
 Onboarding content provider.
 */
class OnboardingContentProvider {
    
    @Inject
    private var logger: Logger
    
    private let data: [OnboardingPageItem]
    
    init(stepCompleted: Binding<Bool>) {
        self.data = [
            OnboardingPageItem(content: AnyView(OnboardingTextPageView(stepCompleted: stepCompleted,
                                                                       text: "Onboarding.Page1.Text")),
                               templateItem: .init(buttonTitle: "Onboarding.NextButton.Title")),
            OnboardingPageItem(content: AnyView(OnboardingUserDataView(stepCompleted: stepCompleted)),
                               templateItem: .init(buttonTitle: "Onboarding.NextButton.Title")),
            OnboardingPageItem(content: AnyView(OnboardingInterfaceSelectionView(stepCompleted: stepCompleted)),
                               templateItem: .init(buttonTitle: "Onboarding.NextButton.Title"))
        ]
    }
    
    /**
     - returns: Onboarding data.
     */
    func getPages() -> [OnboardingPageItem] {
        data
    }
    
    
    /**
     - parameters:
        - index: Page index.
     - returns: Onboarding page for given index.
     */
    func getPageItem(index: Int) -> OnboardingPageItem? {
        let pages = getPages()
        
        guard index < pages.count else {
            logger.log(message: "\(index) out of range \(pages.count)", type: .error)
            return nil
        }
        
        return pages[index]
    }
}
