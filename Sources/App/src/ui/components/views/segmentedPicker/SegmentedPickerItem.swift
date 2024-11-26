import Foundation

class SegmentedPickerItem<Element: Hashable>: Hashable {
    
    static func == (lhs: SegmentedPickerItem<Element>, rhs: SegmentedPickerItem<Element>) -> Bool {
        return lhs.element == rhs.element && lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(element)
        hasher.combine(title)
    }
    
    let element: Element
    let title: String
    
    init(element: Element, title: String) {
        self.element = element
        self.title = title
    }
}
