import SwiftUI

struct DiaryUserLabelView: View {
    
    let userName: String
    
    var body: some View {
        ZStack {
            Text("\(userName) Body Diary")
        }
        .background {
            Color.cyan
        }
    }
}
