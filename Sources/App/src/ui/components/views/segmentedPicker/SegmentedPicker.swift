import SwiftUI
import FoodNotesUI
import FoodNotesKit

struct SegmentedPicker<Element: Hashable>: View {
    
    @StateObject
    private var interfaceService: UIService = DependencyContainer.shared.resolve()
    
    @Binding
    private var selected: Element
    
    private let data: [SegmentedPickerItem<Element>]
    
    init(selected: Binding<Element>,
         data: [SegmentedPickerItem<Element>]) {
        self._selected = selected
        self.data = data
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(interfaceService.colors.controlBackgroundAccent)
                    .cornerRadius(6.0)
                    .padding(4)
                    .frame(width: geo.size.width / CGFloat(data.count))
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                    .offset(x: geo.size.width / CGFloat(data.count) * CGFloat(data.firstIndex(where: {
                        $0.element == selected
                    }) ?? 0), y: 0)
            }
            .frame(height: 40)
            
            HStack(spacing: 0) {
                ForEach(data, id: \.self) { pickerItem in
                    HStack(spacing: 6) {
                        let color = selected == pickerItem.element ?
                        interfaceService.colors.textAccentControl :
                        interfaceService.colors.textMain
                        
                        Text(pickerItem.title)
                            .foregroundStyle(color)
                            .font(interfaceService.fonts.body1)
                    }
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.00001))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selected = pickerItem.element
                        }
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 6.0)
                .fill(interfaceService.colors.groupControlColor.opacity(0.05))
        )
    }
}
