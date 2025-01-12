import SwiftUI
import FoodNotesUI

#Preview {
    let defaultPalette = StandardPalette().all
    
    return ScrollView {
        VStack {
            ForEach(Array(defaultPalette.enumerated()), id: \.offset) { index, color in
                HStack {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                    Text("Color \(index + 1)")
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

#Preview {
    let defaultPalette = QueenPalette().all
    
    return ScrollView {
        VStack {
            ForEach(Array(defaultPalette.enumerated()), id: \.offset) { index, color in
                HStack {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                    Text("Color \(index + 1)")
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}
