//
//  CustomNavigationBarViewController.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit
import SnapKit

class CustomNavigationView: UIView {
    
    private var logoImageView = UIImageView(image: Resources.setImage.logo())
    private var favoritesButton: UIButton!
    private var callButton: UIButton!
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action methods
    
    @objc
    private func favoritesButtonTapped() {
            // Обработка нажатия кнопки "Избранное"
    }
        
        
    @objc
    private func callButtonTapped() {
            // Обработка нажатия кнопки "Позвонить"
    }


}

// MARK: - UI

extension CustomNavigationView {
    
    private func setupUI() {
        setupButtons()
        setupImageView()
        
    
        addView(logoImageView)
        addView(favoritesButton)
        addView(callButton)
        
        setConstraints()
    }
    
    private func setupButtons() {
        
        favoritesButton = UIButton.customNavigationButton(withImageNamed: .star,
                                                          target: self,
                                                          action: #selector(favoritesButtonTapped))
        callButton = UIButton.customNavigationButton(withImageNamed: .phone,
                                                     target: self,
                                                     action: #selector(callButtonTapped))
        
    }
    
    private func setupImageView() {
        
        logoImageView.contentMode = .scaleAspectFit
        
    }
}

// MARK: - Set Constrains

extension CustomNavigationView {
    
    private func setConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(68)
            make.width.equalTo(160)
            make.bottom.equalToSuperview()
            
        }
        
        favoritesButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalTo(callButton.snp.leading).dividedBy(1.3)
        }
        
        callButton.snp.makeConstraints { make in
            make.centerY.equalTo(favoritesButton)
            make.trailing.equalToSuperview().inset(20)
        }
        
    }
}
