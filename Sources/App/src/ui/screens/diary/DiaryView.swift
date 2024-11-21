import SwiftUI
import SwiftData
import BodyDiaryStorage
import Foundation

struct DiaryView: View {
    
    @Environment(\.modelContext) 
    private var modelContext
    
    @Environment(\.horizontalSizeClass)
    private var sizeCategory
    
    @Query
    private var entities: [DailyRecordEntity]

    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geometry in
                    let columnWidth: CGFloat = geometry.size.width / 5
                    let columnWidthCompact: CGFloat = geometry.size.width / 6
                    
                    ScrollView {
                        Grid {
                            GridRow {
                                HStack {
                                    Text("Date")
                                        .frame(width: columnWidth)
                                    Text("Calories")
                                        .frame(width: columnWidthCompact)
                                    Text("Activities")
                                        .frame(width: columnWidth)
                                    Text("Steps")
                                        .frame(width: columnWidthCompact)
                                    Text("Weight")
                                        .frame(width: columnWidthCompact)
                                }
                            }
                            
                            ForEach(entities) { entity in
                                GridRow {
                                    HStack {
                                        Text(entity.listFormattedDate)
                                            .frame(width: columnWidth)
                                        Text(entity.formattedCalories)
                                            .frame(width: columnWidthCompact)
                                        Text(entity.activities)
                                            .frame(width: columnWidth)
                                        Text(entity.formattedSteps)
                                            .frame(width: columnWidthCompact)
                                        Text(entity.formattedWeight)
                                            .frame(width: columnWidthCompact)
                                    }
                                }
                            }
                        }
                        .toolbar {
                            ToolbarItem {
                                Button(action: addItem) {
                                    Label("Add Item", systemImage: "plus")
                                }
                            }
                        }
                    }
                }
            }
            .toolbar(.hidden)
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = DailyRecordEntity(date: .now,
                                            calories: Int.random(in: 1300...6500),
                                            activities: "Swimming",
                                            steps: Int.random(in: 500...15000),
                                            weight: Double.random(in: Double(54.0)...Double(59.2)))
            modelContext.insert(newItem)
        }
    }

    private func deleteEntities(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(entities[index])
            }
        }
    }
}

#Preview {
    DiaryView()
        .modelContainer(for: DailyRecordEntity.self, inMemory: true)
}
