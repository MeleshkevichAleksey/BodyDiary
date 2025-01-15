import SwiftUI
import FoodNotesUI
import FoodNotesKit
import FoodNotesStorage

struct MealCellView: View {
    
    @State
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @State
    private var isEditMealPresented: Bool = false
    
    @State
    var viewModel: MealCellViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isEmptyData {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(uiService.colors.tintMain, style: StrokeStyle(lineWidth: 2, lineJoin: .round, dash: [20, 10]))
            }
            
            VStack {
                if viewModel.isEmptyData {
                    Image(systemName: "plus")
                        .resizable(resizingMode: .tile)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(uiService.colors.tintMain)
                }
                else {
                    ZStack {
                        if let imageData = viewModel.meal.image,
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
            .onTapGesture {
                isEditMealPresented = true
            }
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(1.0, contentMode: .fit)
        .foregroundStyle(uiService.colors.backgroundMain)
        .fullScreenCover(isPresented: $isEditMealPresented, content: {
            EditMealView(viewModel: EditMealViewModel(meal: viewModel.meal),
                         isPresented: $isEditMealPresented)
        })
    }
}

#Preview {
    MealCellView(viewModel: MealCellViewModel(meal: MealEntity()))
        .preferredColorScheme(.dark)
}
