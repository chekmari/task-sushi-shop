//
//  UIButton.swift
//  SUSHUSUSHI
//
//  Created by macbook on 22.09.2023.
//

import Foundation
import UIKit

extension UIButton {
    
    static func customNavigationButton(withImageNamed imageName: Resources.SFSymbols,
                                       target: Any?,
                                       action: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: imageName.rawValue)
        
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = Resources.SetColor.white()
        
        return button
    }
    
    static func cellButton(with target: Any?, and action: Selector) -> UIButton {
        
        let button = UIButton()
        
        button.setTitle("В корзину", for: .normal)
        button.backgroundColor = Resources.SetColor.dodgerBlue()
        button.layer.cornerRadius = 16
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = Resources.SetColor.white()
        
        
        return button
    }
}
