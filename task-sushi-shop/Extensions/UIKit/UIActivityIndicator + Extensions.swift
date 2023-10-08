//
//  UIActivityIndicator + Extensions.swift
//  SUSHUSUSHI
//
//  Created by macbook on 06.10.2023.
//

import UIKit

extension UIActivityIndicatorView {
    
    static func largeSetup() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.style    = .large
        activityIndicator.color    = .gray
        activityIndicator.isHidden = false

        return activityIndicator
    }
    
}
