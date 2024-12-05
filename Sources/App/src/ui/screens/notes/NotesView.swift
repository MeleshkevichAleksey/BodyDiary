import SwiftUI
import SwiftData
import FoodNotesStorage
import FoodNotesKit
import FoodNotesUI
import Foundation
import MijickCalendarView

struct NotesView: View {
    
    @Environment(\.modelContext) 
    private var modelContext
    
    @Environment(\.horizontalSizeClass)
    private var sizeCategory
    
    @StateObject
    private var interfaceService: UIService = DependencyContainer.shared.resolve()
    
    @StateObject
    private var viewModel: NotesViewModel
    
    init(viewModel: NotesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack {
                NotesHeaderView(noteDate: .init(get: {
                    viewModel.selectedNoteDate
                }, set: { date in
                    viewModel.selectedNoteDate = date
                }),
                                calendarInitialDate: viewModel.storageCreatedDate)
                .padding(.top, 16)
                .padding(.leading, 16)
                
                Spacer()
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    NotesView(viewModel: NotesViewModel())
}
