import Combine

/**
 Service maintaining app UI configuration.
 */
public class BodyDiaryUIService: ObservableObject {
    
    @Published
    public var fonts: Fonts
    
    @Published
    public var colors: ColorsService
    
    public init() {
        self.fonts = Fonts()
        self.colors = ColorsService()
        
        subscribeToInnerObject()
    }
    
    private var innerObjectSubscription: AnyCancellable?
    
    private func subscribeToInnerObject() {
        innerObjectSubscription = colors.objectWillChange.sink(receiveValue: objectWillChange.send)
    }
    
}
