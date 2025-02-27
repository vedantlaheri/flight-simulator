import SwiftUI

struct FavButtonTapper: View {
    @Environment(\.dismiss) var dismiss
    @State var titleName: String
    @State var typeIcon: Bricktick.GrapesShapes = .backChev
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    GuideLeader(typeOfImage: typeIcon)
                }
                Text(titleName)
                    .font(FrontGearRight.montserratStyle(size: 24, type: .bold))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                
                GuideLeader(typeOfImage: typeIcon)
                    .opacity(0.0)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .foregroundColor(.white)
        .paddingFlyBullet()
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .frame(height: bigSize ? 137 : 128)
        .background(
            ZStack {
                GuideRight.BoneSet(.cyan)
                Color.clear
                    .contentShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
            }
        )
        .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
    }
    
    var randomAnimal: String {
            let animals = ["Cat", "Dog", "Lion", "Tiger", "Elephant", "Panda", "Zebra"]
            return animals.randomElement() ?? "Unknown"
        }
}

#Preview {
    FavButtonTapper(titleName: "")
}
