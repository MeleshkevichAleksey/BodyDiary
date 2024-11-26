import SwiftData
import Foundation

/**
 Daily progress entry.
 */
@Model
public class DailyRecordEntity: Identifiable {
    
    public let id = UUID()
    
    public var date: Date
    
    public var calories: Int
    
    public var activities: String
    
    public var steps: Int
    
    public var weight: Double
    
    public init(date: Date, calories: Int, activities: String, steps: Int, weight: Double) {
        self.date = date
        self.calories = calories
        self.activities = activities
        self.steps = steps
        self.weight = weight
    }
}
