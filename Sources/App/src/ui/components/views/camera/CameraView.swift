import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage
import AVFoundation

struct CameraView: View {
    
    @State
    private var cameraService: CameraService = DependencyContainer.shared.resolve()
    
    @State
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @State
    private var permissionException: Exception?
    
    @State
    private var viewModel: CameraViewModel
    
    init(viewModel: CameraViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            if cameraService.authorizationStatus == .authorized {
                GeometryReader(content: { geometry in
                    CameraCaptureView(image: $viewModel.capturedImage)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(alignment: .bottom) {
                            cameraButtons()
                                .frame(height: geometry.size.height * 0.15)
                                .background(.black.opacity(0.75))
                        }
                })
            }
            else {
                VStack(spacing: 15) {
                    Image(systemName: "camera")
                        .scaleEffect(CGSize(width: 2.0, height: 2.0))
                        .foregroundStyle(uiService.colors.tintMain)
                    
                    Text("EditMeal.CameraAccessDenied")
                        .multilineTextAlignment(.center)
                        .font(uiService.fonts.body2semi)
                        .foregroundStyle(uiService.colors.textMain)
                }
            }
        }
        .background(uiService.colors.backgroundMain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1.0, contentMode: .fit)
        .alert(permissionException?.message ?? UnexpectedStringError, isPresented: .init(get: {
            permissionException != nil
        }, set: { show in
            if !show {
                permissionException = nil
            }
        })) {
            Button("Ok") { }
        }
        .onAppear(perform: {
            checkPermissions()
        })
        .task {
            await viewModel.cameraCapture.start()
        }
    }
    
    private func cameraButtons() -> some View {
        HStack {
            Button {
                viewModel.cameraCapture.takePhoto()
            } label: {
                ZStack {
                    Circle()
                        .strokeBorder(uiService.colors.textMain, lineWidth: 3)
                        .frame(width: 62, height: 62)
                    Circle()
                        .fill(uiService.colors.textMain)
                        .frame(width: 50, height: 50)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func checkPermissions() {
        Task {
            let result = await cameraService.requestPermission()
            
            switch result {
            case .success(_):
                break
            case .failure(let failure):
                permissionException = failure
            }
        }
    }
}

#Preview {
    CameraView(viewModel: CameraViewModel(photoCompletion: { _ in
        return
    }))
    .preferredColorScheme(.dark)
}
