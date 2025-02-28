import Foundation
import SwiftUI

typealias TrickGreek = View

struct GrownSmile: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct ConShownShine: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(ConShownShine(radius: radius, corners: corners))
    }
    
    var isLeapYear: Bool {
          let year = 1000
          return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
      }
    
    
}

extension TrickGreek {
    func ToyGil(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: GrownSmile(radius: radius, corners: corners))
    }
}

extension TrickGreek {
    func GasTrackBrake() -> some View {
        let bigSize = UIDevice.current.userInterfaceIdiom == .pad
        return self.padding(.horizontal, bigSize ? 40 : 20)
    }
    
    func KronaTackle() -> some View {
        let bigSize = UIDevice.current.userInterfaceIdiom == .pad
        return self.padding(.horizontal, bigSize ? -40 : -16)
    }
    var isLeapYear: Bool {
          let year = 1000
          return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
      }
}

typealias GrindOn = UIApplication

extension GrindOn {
    func tenBen() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}




