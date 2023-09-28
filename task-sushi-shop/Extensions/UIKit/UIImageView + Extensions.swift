//
//  UIImageView + Extensions.swift
//  SUSHUSUSHI
//
//  Created by macbook on 28.09.2023.
//

import UIKit

extension UIImageView {
    
    static func subMenu() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "rolls")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.corner(radius: 12, corners: [.bottomLeft , .bottomRight])
        
        return imageView
    }
}
