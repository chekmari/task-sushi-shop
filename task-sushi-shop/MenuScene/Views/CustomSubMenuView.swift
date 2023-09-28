//
//  CustomSubMenuView.swift
//  SUSHUSUSHI
//
//  Created by macbook on 28.09.2023.
//

import UIKit

class CustomSubMenuView: UIView {

    let name = UILabel.nameText()
    let сomposition = UILabel.composition()
    let cost = UILabel.cost()
    let weight = UILabel.weight()
    let imageView = UIImageView.subMenu()
    private let button = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = Resources.SetColor.black()?.cgColor
        layer.cornerRadius = 12
        
        button.setTitle("В корзину", for: .normal)
        button.tintColor = Resources.SetColor.white()
        button.backgroundColor = Resources.SetColor.dodgerBlue()
        button.layer.cornerRadius = 16
        
        addView(name)
        addView(сomposition)
        addView(cost)
        addView(imageView)
        addView(weight)
        
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

// MARK: - Set Contraints

extension CustomSubMenuView {
    
    private func setConstraints() {

        name.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
        }
        
        сomposition.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(name.snp.bottom).inset(10)
            make.bottom.equalTo(cost.snp.top).inset(10)
        }
        
        cost.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.top)
            make.leading.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        weight.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.top)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.leading.equalTo(cost.snp.trailing).offset(6)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
