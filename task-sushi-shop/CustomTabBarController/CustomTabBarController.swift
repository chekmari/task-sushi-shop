//
//  CustomTabViewController.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit
import SnapKit

class CustomTabBarController: UITabBarController {
    
    let menuVC = MenuViewController()
    let bagVC = BagViewController()
    let infoVC = InfoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuTabBar = UITabBarItem(title: nil,
                                      image: Resources.TabBars.menu(),
                                      selectedImage: Resources.TabBars.menuSelected())
        let bagTabBar = UITabBarItem(title: nil,
                                     image: Resources.TabBars.bag(),
                                     selectedImage: Resources.TabBars.bagSelected())
        let infoTabBar = UITabBarItem(title: nil,
                                      image: Resources.TabBars.info(),
                                      selectedImage: Resources.TabBars.infoSelected())
        
        menuVC.tabBarItem = menuTabBar
        bagVC.tabBarItem = bagTabBar
        infoVC.tabBarItem = infoTabBar
        
        viewControllers = [menuVC, bagVC, infoVC]
        
    }
    
}
