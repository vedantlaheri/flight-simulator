import SwiftUI

struct SearchPanelGray: View {
    enum SearchType: String {
        case dads = "mod"
        case maps = "map"
        case plane = "wallpaper"
        case farm = "skin"
    }
    @State var searchTypeElement: SearchType
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
}

struct SearchPanelWhiteGray_Previews: PreviewProvider {
    static var previews: some View {
        SearchPanelGray(searchTypeElement: .dads, searchText: .constant(""), onCommit: {})
            .previewLayout(.sizeThatFits)
    }
}
