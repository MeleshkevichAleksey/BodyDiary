import SwiftUI
import SwiftData
import FoodNotesStorage
import Foundation

struct NotesView: View {
    
    @Environment(\.modelContext) 
    private var modelContext
    
    @Environment(\.horizontalSizeClass)
    private var sizeCategory

    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    NotesView()
}
