import UIKit

extension UILabel {
    
    
    // MARK: - CategoryCell
    
    static func categoryText() -> UILabel {
        let label = UILabel()
        
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 20)
        label.textColor = Resources.SetColor.white()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }
    
    static func countText() -> UILabel {
        let label = UILabel()
        
        label.font = UIFont(name: Resources.Fonts.arial.rawValue, size: 12)
        label.textColor = Resources.SetColor.silverSans()
        
        return label
    }
    
    // MARK: - Header
    
    static func headerText() -> UILabel {
        let label = UILabel()
        
        label.text = "Header Title"
        label.textColor = Resources.SetColor.white()
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 32)
        
        return label
    }
    
    // MARK: - SubMenuCell
    
    static func nameText() -> UILabel {
        let label = UILabel()
        
        label.text = "name"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = Resources.SetColor.white()
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 17)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }
    
    static func composition() -> UILabel {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = Resources.SetColor.silverSans()
        label.font = UIFont(name: Resources.Fonts.arial.rawValue, size: 11)
        label.allowsDefaultTighteningForTruncation = true
        
        return label
    }
    
    static func cost() -> UILabel {
        let label = UILabel()
        
        label.textAlignment = .right
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 14)
        label.textColor = Resources.SetColor.white()
        
        return label
    }
    
    static func weight() -> UILabel {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 10)
        label.textColor = Resources.SetColor.silverSans()
        
        return label
    }
}
