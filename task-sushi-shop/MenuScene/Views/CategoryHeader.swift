import UIKit

class CategoryHeader: UICollectionReusableView {
    
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
         
         label.text = "Header Title"
        label.textColor = Resources.SetColor.white()
        label.font = UIFont(name: Resources.Fonts.arialBold.rawValue, size: 32)
         addView(label)
       
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
