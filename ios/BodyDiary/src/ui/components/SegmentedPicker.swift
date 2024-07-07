import SwiftUI
import UserInterface
import BodyDiaryKit

struct SegmentedPicker: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    @Binding
    private var selectedIndex: Int
    
    private let data: [String]
    
    init(selectedIndex: Binding<Int>,
         data: [String]) {
        self._selectedIndex = selectedIndex
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
                    .offset(x: geo.size.width / CGFloat(data.count) * CGFloat(selectedIndex), y: 0)
            }
            .frame(height: 40)
            
            HStack(spacing: 0) {
                ForEach((0..<data.count), id: \.self) { index in
                    HStack(spacing: 6) {
                        let color = selectedIndex == index ?
                        interfaceService.colors.textAccentControl :
                        interfaceService.colors.textMain
                        
                        Text(data[index])
                            .foregroundStyle(color)
                            .font(interfaceService.fonts.body1)
                    }
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.00001))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selectedIndex = index
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
