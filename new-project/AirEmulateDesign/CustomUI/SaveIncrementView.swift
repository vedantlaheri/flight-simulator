import SwiftUI

struct SaveIncrementView: View {
    @Binding var saveState: AnyView // Allow dynamic views (SuccessView or FailedView)
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4) // Blurred Background Effect
                .edgesIgnoringSafeArea(.all)
            
            saveState // Dynamically displays SuccessView or FailedView
                .frame(width: 175, height: 80) // Match UI dimensions
        }
    }
}

#Preview {
    SaveIncrementView(saveState: .constant(AnyView(SuccessView()))) // Test with SuccessView
}
