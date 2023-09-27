//
//  SubMenuCell.swift
//  SUSHUSUSHI
//
//  Created by macbook on 26.09.2023.
//

import UIKit

class SubMenuCell: UICollectionViewCell {
    
    private var name = UILabel()
    private var сomposition = UILabel()
    private var cost = UILabel()
    private let imageView = UIImageView()
    private let button = UIButton()
    
    static var idSubMenuCell = "idSubMenuCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = Resources.SetColor.black()?.cgColor
        
        name.text = "name"
        name.textAlignment = .center
        
        сomposition.text = "sostav"
        сomposition.textAlignment = .center
        
        cost.text = "cost"
        cost.textAlignment = .center
        
        imageView.image = UIImage(named: "logo")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.blue.cgColor
        
        
        button.setTitle("fsdfsdfds", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        
        addView(name)
        addView(сomposition)
        addView(cost)
        addView(imageView)
        addView(button)
        
        name.layer.borderWidth = 0.3
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview()
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
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(2.4)
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
