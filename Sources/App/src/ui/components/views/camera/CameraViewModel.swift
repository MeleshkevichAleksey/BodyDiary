import AVFoundation
import SwiftUI
import os.log
import FoodNotesKit

fileprivate let logger = Logger(subsystem: "com.meleshhhkevich.FoodNotes", category: "CameraViewModel")

@Observable
final class CameraViewModel {
    
    let cameraCapture = CameraCapture()
    
    let photoCollection = PhotoCollection(smartAlbum: .smartAlbumUserLibrary)
    
    var photoCompletion: (Data) -> Void
    
    var capturedImage: Image?
    
    var isPhotosLoaded = false
    
    init(photoCompletion: @escaping (Data) -> Void) {
        self.photoCompletion = photoCompletion
        Task {
            await handleCameraPreviews()
        }
        
        Task {
            await handleCameraPhotos()
        }
    }
    
    func handleCameraPreviews() async {
        let imageStream = cameraCapture.previewStream
            .map { $0.image }

        for await image in imageStream {
            Task { @MainActor in
                capturedImage = image
            }
        }
    }
    
    func handleCameraPhotos() async {
        let unpackedPhotoStream = cameraCapture.photoStream
            .compactMap { self.unpackPhoto($0) }
        
        for await photoData in unpackedPhotoStream {
            await savePhoto(imageData: photoData.imageData)
        }
    }
    
    private func unpackPhoto(_ photo: AVCapturePhoto) -> PhotoData? {
        guard let imageData = photo.fileDataRepresentation() else { return nil }

        guard let previewCGImage = photo.previewCGImageRepresentation(),
           let metadataOrientation = photo.metadata[String(kCGImagePropertyOrientation)] as? UInt32,
              let cgImageOrientation = CGImagePropertyOrientation(rawValue: metadataOrientation) else { return nil }
        let imageOrientation = Image.Orientation(cgImageOrientation)
        let thumbnailImage = Image(decorative: previewCGImage, scale: 1, orientation: imageOrientation)
        
        let photoDimensions = photo.resolvedSettings.photoDimensions
        let imageSize = (width: Int(photoDimensions.width), height: Int(photoDimensions.height))
        let previewDimensions = photo.resolvedSettings.previewDimensions
        let thumbnailSize = (width: Int(previewDimensions.width), height: Int(previewDimensions.height))
        
        return PhotoData(thumbnailImage: thumbnailImage, thumbnailSize: thumbnailSize, imageData: imageData, imageSize: imageSize)
    }
    
    @MainActor
    func savePhoto(imageData: Data) {
        Task {
            do {
                photoCompletion(imageData)
                
                try await photoCollection.addImage(imageData)
                logger.debug("Added image data to photo collection.")
            }
            catch let error {
                logger.error("Failed to add image to photo collection: \(error.localizedDescription)")
            }
        }
    }
}

fileprivate struct PhotoData {
    var thumbnailImage: Image
    var thumbnailSize: (width: Int, height: Int)
    var imageData: Data
    var imageSize: (width: Int, height: Int)
}

fileprivate extension CIImage {
    var image: Image? {
        let ciContext = CIContext()
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else { return nil }
        return Image(decorative: cgImage, scale: 1, orientation: .up)
    }
}

fileprivate extension Image.Orientation {

    init(_ cgImageOrientation: CGImagePropertyOrientation) {
        switch cgImageOrientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}
