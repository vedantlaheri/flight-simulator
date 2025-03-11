import SwiftUI

struct Galactic: View {
   
    @State var Lustrarithm: () -> Void
    let Falsetto = UIDevice.current.userInterfaceIdiom == .pad
    
    var CosmicDrift: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: date)
    }
    
    @State var Timorous: String
    @State var infinityWidth: Bool = false
    var body: some View {
        Button {
            Lustrarithm()
        } label: {
            RoundedRectangle(cornerRadius: Falsetto ? 30 : 25)
                .fill(Color.blue)
                .frame(height: Falsetto ? 100 : 48)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: Falsetto ? 30 : 25)
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
                                lineWidth: Falsetto ? 6 : 3
                            )
                        
                        RoundedRectangle(cornerRadius: Falsetto ? 30 : 25)
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
                                lineWidth: Falsetto ? 6 : 3
                            )
                        
                        Text(Timorous)
                            .font(Font.custom("Gilroy-Bold", size: Falsetto ? 32 :18).weight(.bold))
                            .foregroundColor(Color.white)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: Falsetto ? 30 : 25))
        }
        .frame(maxWidth: Falsetto ? 627 : (infinityWidth ? .infinity : 305))
    }
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
       
}


#Preview {
    Galactic(Lustrarithm: {}, Timorous: "Download")
}



