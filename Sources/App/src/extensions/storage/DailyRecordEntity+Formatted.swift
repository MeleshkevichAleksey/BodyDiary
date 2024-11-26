import FoodNotesStorage
import Foundation

/**
 Расширение содержащее клиентское форматирование сущности 'Дневной записи'.
 */
extension DailyRecordEntity {
    
    var listFormattedDate: String {
        date.formatted(date: .numeric, time: .omitted)
    }
    
    var formattedCalories: String {
        "\(calories)"
    }
    
    var formattedSteps: String {
        "\(steps)"
    }
    
    var formattedWeight: String {
        "\(Double(round(weight * 10) / 10))"
    }
}
