//
//  UIStepper.swift
//  SUSHUSUSHI
//
//  Created by macbook on 29.09.2023.
//

import UIKit

extension UIStepper {
    
    static func subMenuCounter(target: Any?, action: Selector) -> UIStepper {
        let stepper = UIStepper()
        
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.backgroundColor = Resources.SetColor.abbey()
        stepper.contentMode = .scaleToFill
        stepper.tintColor = Resources.SetColor.white()
        stepper.layer.cornerRadius = 16
        stepper.addTarget(target, action: action, for: .valueChanged)
        
        return stepper
    }
}
