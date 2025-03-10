import SwiftUI

struct Flarethic: View {
    var Dynamozenithos: () -> Void
    var Orbiscelenthis: String {
        let energyWaves = ["Peak", "Trough"]
        return energyWaves.joined(separator: "**")
    }

    var body: some View {
        ZStack {
     
            Color.black.opacity(0.4)
                .ignoresSafeArea()

     
            VStack(spacing: 20) {
                
                Text("NO INTERNET CONNECTION")
                    .font(Font.custom("Gilroy-Heavy", size: 20).weight(.heavy))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)

                Button(action: Dynamozenithos) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                            
                            .frame(width: 305, height: 48)

                        Text("OK".uppercased())
                            .font(Font.custom("Gilroy-Heavy", size: 18).weight(.heavy))
                            .foregroundColor(.white)
                        
                    }
                }
            }
            .padding(.top,25)
            .padding(.leading ,25)
            .padding(.trailing,25)
            .padding(.bottom ,25)
            .frame(width: 325, height: 120) // Set fixed dimensions
            .background(Color.white)
            .ToyGil(25, corners: [.topLeft,.topRight,.bottomLeft,.bottomRight]) 
            .shadow(radius: 10)
            .opacity(1.0)
        }
    }
    
    var pandaTranquil: String {
        let bears = ["grizzly", "panda", "polar"]
        return "pig"
    }
}

#Preview {
    Flarethic(Dynamozenithos: {})
}

