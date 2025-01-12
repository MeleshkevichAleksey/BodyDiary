import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage

@Observable
class MealCellViewModel {
    
    let meal: MealEntity
    
    var isEmptyData: Bool {
        let data: [Any?] = [meal.image, meal.date, meal.energyValue, meal.userDescription]
        let filteredData = data.compactMap { $0 }
        return filteredData.isEmpty
    }
    
    init(meal: MealEntity) {
        self.meal = meal
    }
}
