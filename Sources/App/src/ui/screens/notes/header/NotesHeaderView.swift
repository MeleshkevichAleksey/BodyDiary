import SwiftUI
import FoodNotesKit
import FoodNotesUI
import MijickCalendarView

struct NotesHeaderView: View {
    
    @Inject
    private var uiService: UIService
    
    @State
    private var showCalendar = false
    
    @Binding
    var noteDate: Date
    
    let calendarInitialDate: Date
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(uiService.colors.controlBackgroundAccent)
                    .onTapGesture {
                        showCalendar = true
                    }
                    .navigationDestination(isPresented: $showCalendar) {
                        MCalendarView(selectedDate: .init(get: {
                            noteDate
                        }, set: { value in
                            noteDate = value ?? Date()
                            showCalendar = false
                        }),
                        selectedRange: nil) {
                            $0.startMonth(calendarInitialDate)
                        }
                    }
                
                Text(noteDate.formatted(date: .complete, time: .omitted))
                    .font(uiService.fonts.jostHeadline4)
                    .foregroundStyle(uiService.colors.textMain)
                
                Spacer()
            }
        }
    }
}

#Preview {
    NotesHeaderView(noteDate: .constant(Date()), calendarInitialDate: Date())
        .preferredColorScheme(.dark)
}
