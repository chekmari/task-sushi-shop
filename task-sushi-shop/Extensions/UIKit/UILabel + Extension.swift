import UIKit

extension UILabel {
    
    static func categoryText() -> UILabel {
        let label = UILabel()
        
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 18)
        label.textColor = Resources.SetColor.white()
        
        return label
    }
    
    static func countText() -> UILabel {
        let label = UILabel()
        
        label.font = UIFont(name: Resources.Fonts.arial.rawValue, size: 8)
        label.textColor = Resources.SetColor.silverSans()
        
        return label
    }
}
