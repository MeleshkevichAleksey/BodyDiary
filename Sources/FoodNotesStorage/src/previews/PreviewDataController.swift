import SwiftData
import UIKit

@MainActor
public class PreviewDataContainer {
    
    private static func bundleImage(named: String) -> UIImage? {
        UIImage(named: named, in: Bundle(for: PreviewDataContainer.self), compatibleWith: nil)
    }
    
    
    private static let showPreviewImage: Bool = false
    
    private static var previewAvatar: Data? {
        return showPreviewImage ? bundleImage(named: "userAvatarPreview")?.pngData() : nil
    }
    
    private static let users: [UserEntity] = [
        UserEntity(name: "Vika",
                   gender: .female,
                   avatar: previewAvatar),
        UserEntity(name: "Alexey",
                   gender: .male,
                   avatar: previewAvatar),
        UserEntity(name: "Boban",
                   gender: .male,
                   avatar: previewAvatar),
        UserEntity(name: "Hristina",
                   gender: .female,
                   avatar: previewAvatar)
    ]
    
    public static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: UserEntity.self, configurations: config)
            
            container.mainContext.insert(users[Int.random(in: users.indices)])

            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
