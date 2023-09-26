//
//  CategoryCell.swift
//  SUSHUSUSHI
//
//  Created by macbook on 24.09.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private var name = UILabel.categoryText()
    private let subMenuCount = UILabel.countText()
    
    static var idCategoryCell = "idCategoryCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = Resources.SetColor.abbey()?.cgColor
        
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(value: String, image: UIImage, count: String) {
        name.text = value
        imageView.image = image
        subMenuCount.text = "\(count) товаров"
    }
}

extension CategoryCell {
    
    private func setConstrains() {
        
        addView(imageView)
        addView(name)
        addView(subMenuCount)
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        
        name.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        subMenuCount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(4)
        }
        
    }
    
}