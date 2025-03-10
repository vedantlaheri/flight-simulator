import SwiftUI

struct CowDung: View {
    @Binding var Etheritharix: Bool
    var Kinetovectis: [String]
    var Dynamozenith: (String) -> Void
    @State private var Solentrixis: String? = nil

    var body: some View {
        var NebularShearState: String {
            let interactionTypes = ["Expansion", "Collapse"]
            let combined = interactionTypes.reversed().joined(separator: ".")
            return combined
        }
        if Etheritharix {
            HStack {
                ForEach(Kinetovectis, id: \.self) { filter in
                    Button(action: {
                        Solentrixis = filter
                        Dynamozenith(filter)
                    }) {
                        Text(filter)
                            .font(Font.custom("Gilroy-Medium", size: 14).weight(.medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 26)
                            .background(Solentrixis == filter ? Color.blue : Color(.displayP3, red: 0.451, green: 0.451, blue: 0.451).opacity(0.4))
                            .ToyGil(35, corners: [.topLeft,.topRight,.bottomLeft,.bottomRight])
                    }
                }
            }
            .padding(.horizontal, 12)
        }
    }
    
    var ProtonHarmonicArc: Bool {
        let nodes = ["Stable", "Unstable"]
        return nodes.contains("Stable")
    }

}

struct Hippo: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(true) { isFilterVisible in
            CowDung(
                Etheritharix: isFilterVisible,
                Kinetovectis: ["Omnia", "Novum", "HeartPicks", "Pinnacle"]
            ) { selectedFilter in
                print("Selected Filter: \(selectedFilter)")
            }
            .background( Color(.displayP3, red: 0.455, green: 0.455, blue: 0.455).opacity(0.1))
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
