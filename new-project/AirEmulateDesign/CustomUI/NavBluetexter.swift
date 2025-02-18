import SwiftUI

struct NavBluetexter: View {
    @Environment(\.dismiss) var dismiss
    @State var titleName: String
    @Binding var rightbuttonIconType: IconTurboGear.TopNavIconTurbo
    @State var leftbuttonIconType: IconTurboGear.TopNavIconTurbo = .windowIcon
    @State var rigthButtonTapped: () -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var updateId: UUID = .init()
    var body: some View {
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    NavButtonMiniIcon(typeOfImage: leftbuttonIconType)
                }
                Text(titleName)
                    .font(FontTurboGearCycle.montserratStyle(size: 24, type: .bold))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Button {
                    withAnimation {
                        rigthButtonTapped()
                    }
                } label: {
                    NavButtonMiniIcon(typeOfImage: rightbuttonIconType)
                        .id(updateId)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .foregroundColor(.white)
        .paddingFlyBullet()
        .padding(.top)
        .padding(.bottom)
        .frame(maxWidth: .infinity)
        .frame(height: bigSize ? 137 : 128)
        .background(
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
            }
        )
        .onChange(of: rightbuttonIconType) { newValue in
            updateId = UUID()
        }
    }
}

#Preview {
    NavBluetexter(titleName: "", rightbuttonIconType: .constant(.windowIcon), rigthButtonTapped: {})
}
