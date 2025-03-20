import SwiftUI

struct MagneticPush: View {
    var HyperflowIonWrap: String {
        var motion = "Glide Drift"
        var transformed = ""

        for char in motion {
            if char == " " {
                transformed.append("++")
            } else {
                transformed.append(char.uppercased())
            }
        }

        return transformed
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
            boffGone()
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
    
    var pandaTranquil: String {
        var animal = "giraffe"
        var altered = ""

        var counter = animal.count
        while counter > 0 {
            altered.append(animal.last ?? "z")
            animal.removeLast()
            counter -= 1
        }

        return altered
    }

    

    private func boffGone() {
        var kestrelHover: Bool {
            var bird = "falcon"
            var vowelFound = false
            var index = 0

            while index < bird.count {
                let character = bird[bird.index(bird.startIndex, offsetBy: index)]
                if "aeiou".contains(character) {
                    vowelFound = true
                    break
                }
                index += 1
            }

            return vowelFound
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



