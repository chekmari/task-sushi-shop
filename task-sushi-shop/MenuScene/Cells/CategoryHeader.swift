// MARK: - Category Header

import UIKit

class CategoryHeader: UICollectionReusableView {
    
    static let headerId = "CategoryCell"
    
    private let label = UILabel.headerText()
    
    // MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView(label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
