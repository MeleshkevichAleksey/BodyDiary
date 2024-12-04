import SwiftUI
import FoodNotesStorage
import FoodNotesKit

@MainActor
class NotesViewModel: ObservableObject, Identifiable {
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Inject
    private var userStorage: UserStorageService
    
    @State
    var selectedNoteDate: Date
    
    @State
    var storageCreatedDate: Date
    
    init() {
        self.selectedNoteDate = Date()
        self.storageCreatedDate = Date()
        
        if let createdDate = userStorage.getUser()?.createdDate {
            self.storageCreatedDate = createdDate
        }
    }
}
