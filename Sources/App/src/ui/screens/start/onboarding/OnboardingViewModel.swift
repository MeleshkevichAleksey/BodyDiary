import SwiftUI
import BodyDiaryKit

/**
 Onboarding view model.
 */
class OnboardingViewModel: ObservableObject {
    
    @Inject
    private var userService: UserService
    
    /**
     Index of the current onboarding page.
     */
    @Published
    var pageIndex: Int = 0
    
    /**
     Flag indicating the completion of the onboarding slides.
     */
    @Published
    var isCompleted: Bool = false
    
    @Published
    var isPageCompleted: Bool = false
    
    private lazy var contentProvider: OnboardingContentProvider = {
        OnboardingContentProvider(stepCompleted: .init(get: {
            self.isPageCompleted
        }, set: { value in
            self.isPageCompleted = value
        }))
    }()
    
    /**
     Proceeds to the next slide or closes the onboarding.
     */
    func nextButtonTap() {
        if pageIndex != contentProvider.getPages().count - 1 {
            pageIndex += 1
        } else {
            userService.isOnboardingCompleted = true
            isCompleted = true
        }
    }
    
    /**
     - returns: The content of the onboarding pages.
     */
    func getContent() -> [some View] {
        return contentProvider.getPages().map { $0.content }
    }
    
    /**
     - returns: The current page content or nil if not found.
     */
    func getCurrentItem() -> OnboardingPageItem? {
        return contentProvider.getPageItem(index: pageIndex)
    }
}
