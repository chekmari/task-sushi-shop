import UIKit

extension CALayer {
    
    func corner(radius: CGFloat, corners: UIRectCorner = .allCorners) {
        if #available(iOS 11.0, *) {
            masksToBounds = true
            cornerRadius = radius
            maskedCorners = corners.caCornerMask
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            mask = shapeLayer
            setNeedsDisplay()
        }
    }
    
}

extension UIRectCorner {
    /// convert UIRectCorner to CACornerMask
    var caCornerMask: CACornerMask {
        var cornersMask = CACornerMask()
        if self.contains(.topLeft) {
            cornersMask.insert(.layerMinXMinYCorner)
        }
        if self.contains(.topRight) {
            cornersMask.insert(.layerMaxXMinYCorner)
        }
        if self.contains(.bottomLeft) {
            cornersMask.insert(.layerMinXMaxYCorner)
        }
        if self.contains(.bottomRight) {
            cornersMask.insert(.layerMaxXMaxYCorner)
        }
        return cornersMask
    }
    
}
