import UIKit

class CategoryHeader: UICollectionReusableView {
    
    let label = UILabel.headerText()
    
    static let headerId = "CategoryCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView(label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
