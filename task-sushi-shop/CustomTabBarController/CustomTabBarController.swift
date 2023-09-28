//
//  CustomTabViewController.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit
import SnapKit

final class CustomTabBarController: UITabBarController {
    
    private let menuVC = MenuViewController()
    private let bagVC = BagViewController()
    private let infoVC = InfoViewController()
    
    private let menuTabBar = UITabBarItem(
        title: nil,
        image: Resources.TabBars.menu(),
        selectedImage: Resources.TabBars.menuSelected()
    )
    private let bagTabBar = UITabBarItem(
        title: nil,
        image: Resources.TabBars.bag(),
        selectedImage: Resources.TabBars.bagSelected()
    )
    private let infoTabBar = UITabBarItem(
        title: nil,
        image: Resources.TabBars.info(),
        selectedImage: Resources.TabBars.infoSelected()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuVC.tabBarItem = menuTabBar
        bagVC.tabBarItem = bagTabBar
        infoVC.tabBarItem = infoTabBar
        
        viewControllers = [menuVC, bagVC, infoVC]
    }
    
}
