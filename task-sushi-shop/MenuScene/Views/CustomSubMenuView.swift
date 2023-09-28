//
//  CustomSubMenuView.swift
//  SUSHUSUSHI
//
//  Created by macbook on 28.09.2023.
//

import UIKit

class CustomSubMenuView: UIView {

    private let name = UILabel.nameText()
    private let сomposition = UILabel.composition()
    private let cost = UILabel.cost()
    private let weight = UILabel.weight()
    private let imageView = UIImageView()
    private let button = UIButton()
    private let dummyView = UIView.dummyView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = Resources.SetColor.black()?.cgColor
        layer.cornerRadius = 12
        
        imageView.image = UIImage(systemName: "fill")
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.blue.cgColor
        
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
        
        name.layer.borderWidth = 0.3
        name.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
        }
        
        сomposition.layer.borderWidth = 0.3
        сomposition.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(name.snp.bottom).inset(10)
            make.bottom.equalTo(cost.snp.top).inset(10)
        }
        
        cost.layer.borderWidth = 0.3
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
            make.height.equalToSuperview().dividedBy(2.4)
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
