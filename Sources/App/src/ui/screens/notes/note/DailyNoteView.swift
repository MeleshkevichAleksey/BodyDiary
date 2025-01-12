import FoodNotesStorage
import FoodNotesKit
import FoodNotesUI
import SwiftUI

/**
 Collection of page-layouted daily notes.
 */
struct DailyNoteView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    private let spacing: CGFloat = 10
    
    @State
    var viewModel: DailyNoteViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 20) {
                    // Main meals
                    VStack {
                        Text("DailyNote.MainMeals")
                            .foregroundStyle(uiService.colors.textMain)
                            .font(uiService.fonts.body2semi)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 20) {
                            MealCellView(viewModel: MealCellViewModel(meal: viewModel.note.breakfast))
                            
                            MealCellView(viewModel: MealCellViewModel(meal: viewModel.note.lunch))
                            
                            MealCellView(viewModel: MealCellViewModel(meal: viewModel.note.dinner))
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    // Snacks
                    VStack {
                        Text("DailyNote.Snacks")
                            .foregroundStyle(uiService.colors.textMain)
                            .font(uiService.fonts.body2semi)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 20) {
                            ForEach(viewModel.note.snacks) { meal in
                                MealCellView(viewModel: MealCellViewModel(meal: meal))
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .background {
            Rectangle()
                .foregroundStyle(uiService.colors.backgroundMain)
                .cornerRadius(10)
                .shadow(color: uiService.colors.tintMain, radius: 5)
        }
    }
}

#Preview {
    DailyNoteView(viewModel: DailyNoteViewModel(note: NoteEntity.previewMock))
        .padding(10)
        .preferredColorScheme(.dark)
}

