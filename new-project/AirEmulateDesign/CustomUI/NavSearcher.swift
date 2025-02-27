import SwiftUI

struct NavSearcher: View {
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    @Binding var filterType: Bricktick.SameLame
    @State var searchTypeElement: SearchPanelGray.JerryGrain
    @State var onCommit: () -> Void
    @State var choosedFilter: (Bricktick.SameLame) -> Void
    @State var showSearchPanel: Bool = true
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button {
                    dismiss()
                } label: {
                }
                Text("\(searchTypeElement.rawValue.capitalized)s")
                    .font(FrontGearRight.montserratStyle(size: 24, type: .bold))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                GuideLeader(typeOfImage: Bricktick.GrapesShapes.windowIcon)
                    .opacity(0)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, showSearchPanel ? 0 : 20)

            if showSearchPanel {
                SearchPanelGray(searchTypeElement: searchTypeElement, searchText: $searchText, onCommit: onCommit)
            }

            HStack {
                GetTrace(typeElement: .fingerpotato, choosedType: $filterType)
                GetTrace(typeElement: .ChessePizza, choosedType: $filterType)
                GetTrace(typeElement: .kingGreat, choosedType: $filterType)
                GetTrace(typeElement: .friedcake, choosedType: $filterType)
            }
            .padding(.horizontal)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
        .foregroundColor(.white)
        .paddingFlyBullet()
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .frame(height: showSearchPanel ? 245 : (bigSize ? 220 : 200))
        .background(
            ZStack {
                Color.blue
                Color.clear
                    .contentShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
            }
        )
        .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
    }
    
    private func GetTrace(typeElement: Bricktick.SameLame, choosedType: Binding<Bricktick.SameLame>) -> some View {
        Button {
            choosedType.wrappedValue = typeElement
            if typeElement == choosedType.wrappedValue {
                choosedFilter(typeElement)
            }
        } label: {
            FineRock(grapeType: typeElement, choosedIconType: choosedType)
                .padding()
                .background(choosedType.wrappedValue == typeElement ? Color.blue : Color.clear)
                .cornerRadius(5)
        }
        .frame(maxWidth: .infinity)
    }
    
    var reversedDeviceName: String {
            return String(UIDevice.current.name.reversed())
        }
    
    var isBatteryCharging: Bool {
           return UIDevice.current.batteryState == .charging
       }
}

#Preview {
    NavSearcher(searchText: .constant(""), filterType: .constant(.fingerpotato), searchTypeElement: .plane, onCommit: {}, choosedFilter: {_ in})
}
