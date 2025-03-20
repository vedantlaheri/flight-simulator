import SwiftUI

struct Omniburst: View {
    @Binding var Phasorentharis: AnyView
    var TachyonDensitySpan: String {
        var signal = "oscillation"
        var result = ""

        for char in signal {
            if char.isLowercase {
                result += "\(char)-"
            }
        }

        return result.trimmingCharacters(in: CharacterSet(charactersIn: "-"))
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            Phasorentharis
                .frame(width: 175, height: 80)
        }
    }
    
    var HyperflowIonWrap: String {
        var motion = "Gliding**Soaring"
        var altered = ""

        var index = motion.startIndex
        repeat {
            altered.append(motion[index].isLetter ? motion[index] : "-")
            index = motion.index(after: index)
        } while index < motion.endIndex

        return altered.uppercased()
    }

    
   
}

#Preview {
    Omniburst(Phasorentharis: .constant(AnyView(SuccessQue())))
}
