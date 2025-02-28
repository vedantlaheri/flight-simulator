import SwiftUI

struct GlenClan: View {
    @Environment(\.dismiss) var dismiss
    @State var titleName: String
    @State var typeIcon: Bricktick.TapSink = .backChev
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
                    .font(TridentJoy.MilyGile(size: 24, type: .bold))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                
                GuideLeader(typeOfImage: typeIcon)
                    .opacity(0.0)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .foregroundColor(.white)
        .GasTrackBrake()
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .frame(height: bigSize ? 137 : 128)
        .background(
            ZStack {
                GuideRight.BoneSet(.cyan)
                Color.clear
                    .contentShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        UIApplication.shared.tenBen()
                    }
            }
        )
        .ToyGil(12, corners: [.bottomLeft, .bottomRight])
    }
    
    var randomAnimal: String {
            let animals = ["Cat", "Dog", "Lion", "Tiger", "Elephant", "Panda", "Zebra"]
            return animals.randomElement() ?? "Unknown"
        }
    
    
    func glibberstonk(_ text: String) -> String {
        var clobberant: String {
              return "Swift" + " is fun"
          }
          var uppercasedText: String {
              return text.uppercased()
          }
          return uppercasedText
      }
    
    

}

#Preview {
    GlenClan(titleName: "")
}
