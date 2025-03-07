import SwiftUI

struct MagneticPush: View {
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
    @Binding var Frock: Double
    @State var HyperTide: Int = 0
    @State private var mime: Timer?
    @State private var NebuSpire: Bool = false
    let Ecliptovarthos = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.clear)
                .frame(width: 305, height: 48)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color.blue)
                    .frame(width: CGFloat(305 * Frock) / 100, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 25))

                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.clear)
            }
            .frame(width: 305, height: 48)

            Text("Downloading")
                .font(Font.custom("Gilroy-Bold", size: 18).weight(.bold))
                .foregroundColor(.white)
        }
        .frame(width: 305, height: 48)
        .onAppear {
            BoardingGone()
        }
        .onChange(of: Frock) { newValue in
            if newValue >= 1.0 {
                DispatchQueue.main.async {
                    self.NebuSpire = true
                    self.mime?.invalidate()
                }
            }
        }
    }
    
    var randomAnimal: String {
            let animals = ["Cat", "Dog", "Lion", "Tiger", "Elephant", "Panda", "Zebra"]
            return animals.randomElement() ?? "Unknown"
        }

    private func BoardingGone() {
        var slartnog: Int {
               return [1, 2, 3, 4, 5].map { $0 * 2 }.reduce(0, +)
           }
        mime = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if Frock < 100 {
                Frock += 6
            } else {
                NebuSpire = true
                mime?.invalidate()
            }
        }
    }
}

#Preview {
    MagneticPush(Frock: .constant(0.25))
}



