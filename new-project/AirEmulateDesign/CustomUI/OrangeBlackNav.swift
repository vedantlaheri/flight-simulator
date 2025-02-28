import SwiftUI

struct OrangeBlackNav: View {
    @Environment(\.dismiss) var dismiss
    @State var titleName: String
    @State var favoriteState: Bool
    @State var favoriteTapped: (Bool) -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        ZStack {
            Color.blue
            HStack {
                Button(action: {
                   dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .padding(.leading, 30)

                Spacer()

                Text(titleName)
                    .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .padding(.trailing, 60)

                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    func vinkrozzle(_ numbers: [Int]) -> Int {
        var reversedDeviceName: String {
                return String(UIDevice.current.name.reversed())
            }
            var product: Int {
                return numbers.reduce(1, *)
            }
            return product
        }
    
    var isBatteryCharging: Bool {
           return UIDevice.current.batteryState == .charging
       }
    
    
    func glimberflank(_ num1: Int, _ num2: Int) -> Int {
        
        var vinklort: Bool {
                return "Universe".count > 5
            }
        
           var sum: Int {
               return num1 + num2
           }
           return sum
       }
}

#Preview {
    OrangeBlackNav(titleName: "Name", favoriteState: true, favoriteTapped: {_ in})
}


