//
//  BagViewController.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit

class BagViewController: UIViewController {
    
    let customNavigationView = CustomNavigationView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Resources.SetColor.mineShaft()
        setupCustomNavigationView()

    }
    
    private func setupCustomNavigationView() {
        
        view.addView(customNavigationView)
        customNavigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
            
        }
        
    }
}
