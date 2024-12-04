import SwiftUI
import FoodNotesKit
import FoodNotesUI
import MijickCalendarView

struct NotesHeaderView: View {
    
    @Binding
    var noteDate: Date
    
    let calendarInitialDate: Date
    
    var body: some View {
        HStack {
            NavigationLink {
                MCalendarView(selectedDate: .init(get: {
                    noteDate
                }, set: { value in
                    noteDate = value ?? Date()
                }),
                              selectedRange: nil) {
                    $0.startMonth(calendarInitialDate)
                }
            } label: {
                Image(systemName: "calendar")
            }
            
            Text(noteDate.formatted(date: .complete, time: .omitted))
        }
    }
}
