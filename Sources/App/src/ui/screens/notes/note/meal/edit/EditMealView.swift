import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage

struct EditMealView: View {
    
    @State
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @State
    var viewModel: EditMealViewModel
    
    @Binding
    var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Image(systemName: "xmark")
                    .resizable(resizingMode: .tile)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(uiService.colors.tintMain)
                    .onTapGesture {
                        isPresented = false
                    }
            }
            .padding(.horizontal, 26)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(uiService.colors.backgroundMain)
    }
}

#Preview {
    EditMealView(viewModel: EditMealViewModel(meal: MealEntity.previewMock),
                 isPresented: .constant(true))
}
