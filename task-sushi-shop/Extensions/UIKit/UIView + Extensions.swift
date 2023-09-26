//
//  UIView + Extensions.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit

// MARK: - Custom Add View

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

// MARK: String Type Name

extension UIView {
    
  static var typeName: String {
    return String(describing: self)
  }
    
}
