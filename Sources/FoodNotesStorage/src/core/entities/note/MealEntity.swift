import SwiftData
import Foundation

/**
 Meal data model.
 */
@Model
public class MealEntity {
    
    public static var previewMock: MealEntity {
        MealEntity(date: Date(),
                   userDescription: "Great meal",
                   energyValue: MealEnergyValueEntity(carbs: 123.3,
                                                      fats: 123.2,
                                                      proteins: 22.6,
                                                      kcal: 300))
    }
    
    @Attribute(.unique)
    public let id: UUID
    
    @Attribute(.externalStorage)
    public var image: Data?
    
    public var date: Date?
    
    public var userDescription: String?
    
    @Relationship(deleteRule: .cascade)
    public var energyValue: MealEnergyValueEntity?
    
    public init(image: Data? = nil,
                date: Date? = nil,
                userDescription: String? = nil,
                energyValue: MealEnergyValueEntity? = nil) {
        self.id = UUID()
        self.image = image
        self.date = date
        self.userDescription = userDescription
        self.energyValue = energyValue
    }
}
