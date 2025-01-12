import FoodNotesKit
import SwiftUI
import FoodNotesStorage

@Observable
class DailyNoteViewModel {
    
    let note: NoteEntity
    
    init(note: NoteEntity) {
        self.note = note
    }
}
