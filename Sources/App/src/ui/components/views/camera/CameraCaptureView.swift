import SwiftUI

struct CameraCaptureView: View {
    
    @Binding var image: Image?
    
    var body: some View {
        GeometryReader { geometry in
            if let image {
                image
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

#Preview {
    CameraCaptureView(image: .constant(Image(systemName: "camera")))
}
