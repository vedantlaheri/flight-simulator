import SwiftUI

struct FilterLightComponentElementDark: View {
    @Binding var isFilterVisible: Bool
    var filterOptions: [String]
    var onFilterSelect: (String) -> Void
    @State private var selectedFilter: String? = nil

    var body: some View {
        if isFilterVisible {
            HStack {
                ForEach(filterOptions, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                        onFilterSelect(filter)
                    }) {
                        Text(filter)
                            .font(Font.custom("Gilroy-Medium", size: 14).weight(.medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 26)
                            .background(selectedFilter == filter ? Color.blue : Color(.displayP3, red: 0.451, green: 0.451, blue: 0.451).opacity(0.4)) // Dynamic background
                            .cornerRadius(35, corners: [.topLeft,.topRight,.bottomLeft,.bottomRight])
                    }
                }
            }
            .padding(.horizontal, 12)
        }
    }
    
    var systemUptime: TimeInterval {
        return ProcessInfo.processInfo.systemUptime
    }

}

struct FilterComponentElement_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(true) { isFilterVisible in
            FilterLightComponentElementDark(
                isFilterVisible: isFilterVisible,
                filterOptions: ["All", "New", "Favourite", "Top"]
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
