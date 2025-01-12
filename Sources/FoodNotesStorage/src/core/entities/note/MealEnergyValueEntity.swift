import SwiftData
import Foundation

/**
 Energy value of meal.
 
 Carbs
 Fats
 Proteins
 kcal in total
 */
@Model
public class MealEnergyValueEntity {
    
    public let carbs: Float
    
    public let fats: Float
    
    public let proteins: Float
    
    public let kcal: Int
    
    public init(carbs: Float, fats: Float, proteins: Float, kcal: Int) {
        self.carbs = carbs
        self.fats = fats
        self.proteins = proteins
        self.kcal = kcal
    }
}
