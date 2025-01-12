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
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @State
    private var viewModel: NotesViewModel
    
    init(viewModel: NotesViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                NotesHeaderView(noteDate: .init(get: {
                    viewModel.selectedNoteDate
                }, set: { date in
                    viewModel.selectDate(date: date)
                }),
                                calendarInitialDate: viewModel.storageCreatedDate)
                .padding(.top, 16)
                .padding(.leading, 16)
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .center, spacing: 0, content: {
                        ForEach(viewModel.notes) { note in
                            DailyNoteView(viewModel: DailyNoteViewModel(note: note))
                                .padding(10)
                                .scrollTransition(.interactive) { content, phase in
                                    content.opacity(phase.isIdentity ? 1 : 0)
                                }
                                .id(note)
                        }
                        .containerRelativeFrame(.horizontal, alignment: .center)
                    })
                }
                .scrollTargetLayout()
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .scrollPosition(id: $viewModel.selectedNote)
                .animation(.smooth, value: viewModel.selectedNote)
                
                Spacer()
            }
            .background(uiService.colors.backgroundMain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar(.hidden)
        }
    }
}

#Preview {
    NotesView(viewModel: NotesViewModel())
        .preferredColorScheme(.dark)
}
