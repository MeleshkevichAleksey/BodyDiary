import SwiftUI
import BodyDiaryKit
import UserInterface

struct OnboardingView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    @StateObject
    private var viewModel: OnboardingViewModel
    
    /**
     Конструктор.
     */
    init(viewModel: OnboardingViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Onboarding.Welcome")
                            .font(interfaceService.fonts.jostTitle)
                            .foregroundStyle(interfaceService.colors.textMain)
                        Text("AppName")
                            .font(interfaceService.fonts.jostTitle)
                            .foregroundStyle(interfaceService.colors.textAccent)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 48)
                .padding(.horizontal, 20)
                
                TabView(selection: Binding<Int>(
                    get: {
                        viewModel.pageIndex
                    },
                    set: { newValue in
                        viewModel.pageIndex = newValue
                    }
                )) {
                    ForEach(viewModel.getContent().indices, id: \.self) { index in
                        VStack {
                            viewModel.getContent()[index].tag(index)
                            
                            Spacer()
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .animation(.easeIn)
                .padding(.horizontal, 5)
            }
            
            VStack {
                if let content = viewModel.getCurrentItem() {
                    OnboardingTemplatePageView(item: content.templateItem,
                                               buttonAction: { viewModel.nextButtonTap() },
                                               isButtonEnabled: $viewModel.isPageCompleted)
                }
            }
            .padding(.horizontal, 16)
        }
        .background(interfaceService.colors.backgroundMain)
    }
}

#Preview {
    OnboardingView(viewModel: .init())
        .preferredColorScheme(.dark)
}
