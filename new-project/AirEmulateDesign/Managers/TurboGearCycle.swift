import Foundation
import SwiftUI

typealias TurboGearCycle = View

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
    
    
}

extension TurboGearCycle {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

extension TurboGearCycle {
    func paddingFlyBullet() -> some View {
        let bigSize = UIDevice.current.userInterfaceIdiom == .pad
        return self.padding(.horizontal, bigSize ? 40 : 20)
    }
    
    func paddingAntiFlyBullet() -> some View {
        let bigSize = UIDevice.current.userInterfaceIdiom == .pad
        return self.padding(.horizontal, bigSize ? -40 : -16)
    }
}

typealias ApplicationSuperFastExt = UIApplication

extension ApplicationSuperFastExt {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//extension View {
//    func customCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape(RoundedCorner(radius: radius, corners: corners))
//    }
//}
//
//struct RoundedCornersShape: Shape {
//    var radius: CGFloat = 20
//    var corners: UIRectCorner
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(
//            roundedRect: rect,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//        return Path(path.cgPath)
//    }
//}
//
//
//struct RoundedCorner: Shape {
//    var radius: CGFloat = 0
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(
//            roundedRect: rect,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//        return Path(path.cgPath)
//    }
//}


