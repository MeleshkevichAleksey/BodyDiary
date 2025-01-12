import SwiftData
import Foundation

/**
 Daily food note model.
 */
@Model
public class NoteEntity {
    
    public static var previewMock: NoteEntity {
        NoteEntity(date: Date(),
                   breakfast: MealEntity(),
                   lunch: MealEntity(),
                   dinner: MealEntity(),
                   snacks: [MealEntity(), MealEntity()])
    }
    
    @Attribute(.unique)
    public let id: UUID
    
    public let date: Date
    
    @Relationship(deleteRule: .cascade)
    public var breakfast: MealEntity
    
    @Relationship(deleteRule: .cascade)
    public var lunch: MealEntity
    
    @Relationship(deleteRule: .cascade)
    public var dinner: MealEntity
    
    @Relationship(deleteRule: .cascade)
    public var snacks: [MealEntity]
    
    public init(date: Date,
                breakfast: MealEntity,
                lunch: MealEntity,
                dinner: MealEntity,
                snacks: [MealEntity]) {
        self.id = UUID()
        self.date = date
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
        self.snacks = snacks
    }
}
