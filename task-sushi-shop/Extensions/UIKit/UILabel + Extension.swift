import UIKit

extension UILabel {
    
    
    // MARK: - CategoryCell
    
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
        
        label.text = "Header Title"
        label.textColor = Resources.SetColor.white()
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 32)
        
        return label
    }
}
