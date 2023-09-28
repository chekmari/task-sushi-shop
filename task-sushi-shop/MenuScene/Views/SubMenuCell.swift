//
//  SubMenuCell.swift
//  SUSHUSUSHI
//
//  Created by macbook on 26.09.2023.
//

import UIKit

class SubMenuCell: UICollectionViewCell {
    
    private let subMenuView = CustomSubMenuView()
    private let button = UIButton()
    
    
    static var idSubMenuCell = "idSubMenuCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.opacity = 0
        layer.cornerRadius = 12
        
        addView(subMenuView)
        
        subMenuView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(25)
        }
        
        button.setTitle("В корзину", for: .normal)
        button.tintColor = Resources.SetColor.white()
        button.backgroundColor = Resources.SetColor.dodgerBlue()
        button.layer.cornerRadius = 8
        addView(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(14)
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

