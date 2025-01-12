import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage

@Observable
class EditMealViewModel {
    
    let meal: MealEntity
    
    init(meal: MealEntity) {
        self.meal = meal
    }
}
