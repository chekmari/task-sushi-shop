// MARK: - Category Cell

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    static  var idCategoryCell = "idCategoryCell"
    
    private let imageView = UIImageView.category()
    private var name = UILabel.categoryText()
    private let subMenuCount = UILabel.countText()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = Resources.SetColor.abbey()?.cgColor
        layer.cornerRadius = 10
        
        addView(imageView)
        addView(name)
        addView(subMenuCount)
        
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    public func configure(name: String, count: Int, image: String) {
        
        let url = URL(string: "\(Network.URLs.image.rawValue)\(image)")
        
        self.name.text = name
        subMenuCount.text = "\(count) товаров"
        self.imageView.kf.setImage(with: url)

    }
    
}

// MARK: - Set Constraints

extension CategoryCell {
    
    private func setConstrains() {
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(6)
        }
        
        subMenuCount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
    }
    
}
