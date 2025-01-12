import SwiftUI
import SwiftData
import FoodNotesKit
import FoodNotesUI
import FoodNotesStorage
import PopupView

struct OnboardingUserDataView: View {
    
    @StateObject
    private var uiService: UIService = DependencyContainer.shared.resolve()
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var userEntities: [UserEntity]
    
    @State
    private var userName: String = String()
    
    @FocusState
    private var isFocused: Bool
    
    @State
    private var selectedGender: UserGender = .male
    
    @State
    private var showErrorPopup: Bool = false
    
    @Binding
    var stepCompleted: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Onboarding.Page2.NameDescription")
                        .font(uiService.fonts.body4)
                        .foregroundStyle(uiService.colors.textMain)
                        .truncationMode(.tail)
                    
                    TextField("Onboarding.Page2.NamePlaceholder", text: .init(get: {
                        self.userName
                    }, set: { newValue in
                        self.userName = newValue
                        saveUserData()
                    }))
                    .textFieldStyle(AppTextFieldStyle())
                    .submitLabel(.done)
                    .focused($isFocused)
                }
                
                VStack(alignment: .leading) {
                    Text("Onboarding.Page2.GenderDesciption")
                        .font(uiService.fonts.body4)
                        .foregroundStyle(uiService.colors.textMain)
                        .truncationMode(.tail)
                }
                
                SegmentedPicker<UserGender>(selected: $selectedGender,
                                            data: getGenderPickerItems())
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            .background(uiService.colors.groupColor)
            .clipShape(.buttonBorder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onTapGesture {
            isFocused = false
        }
        .popup(isPresented: $showErrorPopup, view: {
            Text("Error saving user occurred")
                .font(uiService.fonts.body1)
                .foregroundStyle(uiService.colors.textAccentControl)
        }, customize: {
            $0
                .type(.toast)
                .position(.top)
        })
        .onChange(of: selectedGender, { oldValue, newValue in
            saveUserData()
        })
        .onAppear(perform: {
            loadUser()
            stepCompleted = UserNameValidator.validate(userName)
        })
        .onDisappear(perform: {
            isFocused = false
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
        
        guard UserValidator.validate(userEntity) else {
            stepCompleted = false
            return
        }
        
        do {
            try modelContext.save()
            stepCompleted = true
        }
        catch {
            showErrorPopup = true
        }
    }
    
    private func getGenderPickerItems() -> [SegmentedPickerItem<UserGender>] {
        UserGender.allCases.map { SegmentedPickerItem(element: $0,
                                                      title: $0.rawValue.capitalized) }
    }
}

#Preview {
    OnboardingUserDataView(stepCompleted: .constant(true))
        .preferredColorScheme(.dark)
}
