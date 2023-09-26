//
//  Resources .swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import Foundation
import UIKit

enum Resources {
    
    enum ElementUIColors: Int {
        
        case mineShaft = 0x242424 // фон
        case dodgerBlue = 0x4562FF // выбранные эелементы
        case white = 0xFFFFFF
        case black = 0x000000 //
        case abbey = 0x424344 // не выбранные элементы и
        case yellow = 0xFFE252
        case silverSans = 0xB5B6B6
        
    }
    
    enum Images: String {
        
        case logo = "logo"
        
    }
    
    enum Fonts: String {
        
        case arialBold = "Arial Bold"
        case arial = "Arial"
        
    }
    
    enum SFSymbols: String {
        
        case menu = "list.bullet"
        case bag = "bag"
        case info = "info"
        case star = "star"
        case phone = "phone"
        
    }
    
    enum TabBars {
        
        static func menu() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.menu.rawValue)?.withTintColor(Resources.SetColor.white() ?? .white,
                                                                                  renderingMode: .alwaysOriginal)
        }
        static func bag() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.bag.rawValue)?.withTintColor(Resources.SetColor.white() ?? .white,
                                                                                 renderingMode: .alwaysOriginal)
        }
        static func info() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.info.rawValue)?.withTintColor(Resources.SetColor.white() ?? .white,
                                                                                  renderingMode: .alwaysOriginal)
        }
        static func star() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.star.rawValue)?.withTintColor(Resources.SetColor.white() ?? .white,
                                                                                  renderingMode: .alwaysOriginal)
        }
        static func phone() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.phone.rawValue)?.withTintColor(Resources.SetColor.white() ?? .white,
                                                                                   renderingMode: .alwaysOriginal)
        }
        
        static func menuSelected() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.menu.rawValue)?.withTintColor(Resources.SetColor.yellow() ?? .yellow,
                                                                                  renderingMode: .alwaysOriginal)
        }
        static func bagSelected() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.bag.rawValue)?.withTintColor(Resources.SetColor.yellow() ?? .yellow,
                                                                                 renderingMode: .alwaysOriginal)
        }
        static func infoSelected() -> UIImage? {
            UIImage(systemName: Resources.SFSymbols.info.rawValue)?.withTintColor(Resources.SetColor.yellow() ?? .yellow, 
                                                                                  renderingMode: .alwaysOriginal)
        }
        
    }
    
    enum SetColor {
        
        static func mineShaft() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.mineShaft.rawValue)
        }
        static func dodgerBlue() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.dodgerBlue.rawValue)
        }
        static func abbey() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.abbey.rawValue)
        }
        static func white() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.white.rawValue)
        }
        static func black() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.black.rawValue)
        }
        static func yellow() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.yellow.rawValue)
        }
        static func silverSans() -> UIColor? {
            UIColor(rgb: Resources.ElementUIColors.silverSans.rawValue)
        }
        
        
    }
    
    enum setImage {
        
        static func logo() -> UIImage? {
            UIImage(named: Resources.Images.logo.rawValue)
        }
        
    }
    
}
