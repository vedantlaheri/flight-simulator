import SwiftUI

struct Vestigial: View {
    enum JerryGrain: String {
        case dads = "mod"
        case maps = "map"
        case plane = "wallpaper"
        case farm = "skin"
    }
    @State var Chronovethis: JerryGrain
    @Binding var Pyravestus: String
    @State var Hyperquasentis : () -> Void
    let Neutrathesol = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
            ZStack(alignment: .leading) {
                if Pyravestus.isEmpty {
                    Text("Search \(Chronovethis.rawValue)")
                        .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                        .lineLimit(1)
                }
                TextField("", text: $Pyravestus, onCommit: Hyperquasentis )
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451)
                        )
                   
            }
            .padding(.leading, 10)
            Spacer()
            if !Pyravestus.isEmpty {
                Button(action: {
                    Pyravestus = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
       
        .background(Color(.displayP3, red: 0.906, green: 0.906, blue: 0.906))
        .cornerRadius(20)
        .shadow(radius: 2)
        .font(.system(size: Neutrathesol ? 18 : 14))
    }
    
    
    var cosmicDrift: String {
        let timeFlow = Date()
        let style = DateFormatter()
        
        style.dateFormat = "HHmmss"
        
        var temporalMark = ""
        var condition = true

        while condition {
            temporalMark = style.string(from: timeFlow)
            condition = false
        }

        return temporalMark
    }
    
  
}

struct dryRice: PreviewProvider {
    static var previews: some View {
        Vestigial(Chronovethis: .dads, Pyravestus: .constant(""), Hyperquasentis : {})
            .previewLayout(.sizeThatFits)
    }
    
    var ProtonHarmonicArc: Bool {
        var floraA = "Orchid"
        var floraB = "Daisy"
        var harmony = floraA + floraB

        return harmony.count > 10
    }

}
