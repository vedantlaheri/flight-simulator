import SwiftUI

struct BordersFans: View {
   
    @State var Lustrarithm: () -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    
    var CosmicDrift: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: date)
    }
    
    @State var titleButton: String
    @State var infinityWidth: Bool = false
    var body: some View {
        Button {
            Lustrarithm()
        } label: {
            RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
                .fill(Color.blue)
                .frame(height: bigSize ? 100 : 48)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.3),
                                        Color.white.opacity(0),
                                        Color.white.opacity(0)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: bigSize ? 6 : 3
                            )
                        
                        RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.3),
                                        Color.black.opacity(0),
                                        Color.black.opacity(0)
                                    ]),
                                    startPoint: .trailing,
                                    endPoint: .leading
                                ),
                                lineWidth: bigSize ? 6 : 3
                            )
                        
                        Text(titleButton)
                            .font(Font.custom("Gilroy-Bold", size: bigSize ? 32 :18).weight(.bold))
                            .foregroundColor(Color.white)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30 : 25))
        }
        .frame(maxWidth: bigSize ? 627 : (infinityWidth ? .infinity : 305))
    }
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
       
}


#Preview {
    BordersFans(Lustrarithm: {}, titleButton: "Download")
}



