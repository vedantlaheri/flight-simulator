import SwiftUI

struct SearchPanelGray: View {
    enum JerryGrain: String {
        case dads = "mod"
        case maps = "map"
        case plane = "wallpaper"
        case farm = "skin"
    }
    @State var searchTypeElement: JerryGrain
    @Binding var searchText: String
    @State var onCommit: () -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    Text("Search \(searchTypeElement.rawValue)")
                        .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                        .lineLimit(1)
                }
                TextField("", text: $searchText, onCommit: onCommit)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451)
                        )
                   
            }
            .padding(.leading, 10)
            Spacer()
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
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
        .font(.system(size: bigSize ? 18 : 14))
    }
    
    
    var randomAnimal: String {
            let animals = ["Cat", "Dog", "Lion", "Tiger", "Elephant", "Panda", "Zebra"]
            return animals.randomElement() ?? "Unknown"
        }
    
    enum AnimalType {
        case mammal(species: String, lifespan: Int)
        case reptile(species: String, venomous: Bool)
        case bird(species: String, wingspan: Double)
        case fish(species: String, waterType: String)
        case insect(species: String, colonySize: Int)
    }
}

struct SearchPanelWhiteGray_Previews: PreviewProvider {
    static var previews: some View {
        SearchPanelGray(searchTypeElement: .dads, searchText: .constant(""), onCommit: {})
            .previewLayout(.sizeThatFits)
    }
}
