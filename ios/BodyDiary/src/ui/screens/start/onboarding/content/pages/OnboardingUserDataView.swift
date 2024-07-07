import SwiftUI
import SwiftData
import BodyDiaryKit
import UserInterface
import Storage
import PopupView

struct OnboardingUserDataView: View {
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var userEntities: [UserEntity]
    
    @State
    private var userName: String = String()
    
    @State
    private var selectedGender: UserGender = .male
    
    @State
    private var selectedSegment = 0
    
    @State
    private var showErrorPopup: Bool = false
    
    @Binding
    var stepCompleted: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Onboarding.Page2.NameDescription")
                        .font(interfaceService.fonts.body4)
                        .foregroundStyle(interfaceService.colors.textMain)
                        .truncationMode(.tail)
                    
                    TextField("Onboarding.Page2.NamePlaceholder", text: .init(get: {
                        self.userName
                    }, set: { newValue in
                        self.userName = newValue
                        
                        guard UserNameValidator.validate(newValue) else {
                            return
                        }
                        saveUserData()
                    }))
                    .textFieldStyle(AppTextFieldStyle())
                }
                
                VStack(alignment: .leading) {
                    Text("Onboarding.Page2.GenderDesciption")
                        .font(interfaceService.fonts.body4)
                        .foregroundStyle(interfaceService.colors.textMain)
                        .truncationMode(.tail)
                }
                
                SegmentedPicker(selectedIndex: $selectedSegment,
                                data: UserGender.allCases.map { $0.rawValue.capitalized })
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            .background(interfaceService.colors.groupColor)
            .clipShape(.buttonBorder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .popup(isPresented: $showErrorPopup, view: {
            Text("Error saving user occurred")
                .font(interfaceService.fonts.body1)
                .foregroundStyle(interfaceService.colors.textAccentControl)
        }, customize: {
            $0
                .type(.toast)
                .position(.top)
        })
        .onAppear(perform: {
            loadUser()
            stepCompleted = UserNameValidator.validate(userName)
        })
    }
    
    private func loadUser() {
        if let user = userEntities.first {
            self.userName = user.name
            self.selectedGender = user.gender
        }
    }
    
    private func saveUserData() {
        let userEntity: UserEntity
        
        if let user = userEntities.first {
            userEntity = user
            userEntity.name = userName
            userEntity.gender = selectedGender
        }
        else {
            userEntity = UserEntity(name: userName, gender: selectedGender)
            modelContext.insert(userEntity)
        }
        
        do {
            try modelContext.save()
            stepCompleted = true
        }
        catch {
            showErrorPopup = true
        }
    }
}

#Preview {
    OnboardingUserDataView(stepCompleted: .constant(true))
        .preferredColorScheme(.dark)
}
