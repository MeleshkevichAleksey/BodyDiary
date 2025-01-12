import SwiftUI
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage
import SwiftData
import PhotosUI
import PopupView

struct UserAvatarView: View {
    
    @Inject
    private var logger: Logger
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var userEntities: [UserEntity]
    
    @State
    private var userName: String = String()
    
    @State
    private var userAvatar: UIImage? = nil
    
    @State
    private var showTakePhotoSide: Bool = false
    
    @State
    private var avatarItem: PhotosPickerItem?
    
    @State
    private var showPicker: Bool = false
    
    @State
    private var showErrorPopup: Bool = false
    
    var body: some View {
        ZStack {
            if let userAvatar {
                Image(uiImage: userAvatar)
                    .resizable()
                    .scaledToFill()
            }
            else {
                VStack {
                    if !showTakePhotoSide {
                        Text(userName.first?.uppercased() ?? String())
                            .font(uiService.fonts.headline3)
                            .foregroundStyle(uiService.colors.textMain)
                    }
                    else {
                        Image(systemName: "camera")
                            .foregroundStyle(uiService.colors.textMain)
                    }
                }
                .rotation3DEffect(.degrees(showTakePhotoSide ? 180 : 0),
                                  axis: (x: 0.0, y: 1.0, z: 0.0))
                .animation(.default, value: showTakePhotoSide)
            }
        }
        .frame(width: 60, height: 60)
        .photosPicker(isPresented: $showPicker,
                      selection: $avatarItem,
                      matching: .images)
        .onTapGesture {
            showPicker = true
        }
        .background(uiService.colors.groupControlColor)
        .clipShape(Circle())
        .popup(isPresented: $showErrorPopup, view: {
            Text("Error saving user occurred")
                .font(uiService.fonts.body1)
                .foregroundStyle(uiService.colors.textAccentControl)
        }, customize: {
            $0
                .type(.toast)
                .position(.top)
        })
        .onAppear(perform: {
            bindUser()

            Task {
                await checkUserPhoto()
            }
        })
        .onChange(of: avatarItem, { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    userAvatar = image
                    saveUserData(imageData: data)
                }
                else {
                    logger.log(message: "Failed to set new avatar from item \(String(describing: newItem))", type: .error)
                }
            }
        })
    }
    
    private func bindUser() {
        if let user = userEntities.first {
            userName = user.name
            
            if let imageData = user.avatar,
               let image = UIImage(data: imageData) {
                userAvatar = image
            }
        }
        else {
            logger.log(message: "User not found", type: .error)
        }
    }

    private func checkUserPhoto() async {
        let secondsInterval: UInt64 = 2
        try? await Task.sleep(nanoseconds: secondsInterval * 1_000_000_000)

        if userAvatar == nil {
            showTakePhotoSide.toggle()
            await checkUserPhoto()
        }
        else {
            showTakePhotoSide = false
        }
    }
    
    private func saveUserData(imageData: Data) {
        guard let user = userEntities.first else {
            logger.log(message: "User not exists", type: .error)
            return
        }
        
        user.avatar = imageData
        
        do {
            try modelContext.save()
        }
        catch {
            logger.log(message: "Data not saved", type: .error)
        }
    }
}

#Preview {
    UserAvatarView()
        .preferredColorScheme(.dark)
        .modelContainer(PreviewDataContainer.previewContainer)
}
