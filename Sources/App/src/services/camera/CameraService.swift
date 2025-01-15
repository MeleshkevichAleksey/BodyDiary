import UIKit
import Foundation
import AVFoundation
import FoodNotesKit

@Observable
class CameraService {
    
    var authorizationStatus: AVAuthorizationStatus
    
    init() {
        self.authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                               object: nil,
                                               queue: .main) { [weak self] _ in
            self?.authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        }
    }
    
    func requestPermission() async -> Result<Void, Exception> {
        self.authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        if authorizationStatus == .authorized {
            return .success(())
        }
        else {
            let status = await AVCaptureDevice.requestAccess(for: .video)
            return status ? .success(()) : .failure(Exception(message: "Access to camera denied. Check settings"))
        }
    }
}
