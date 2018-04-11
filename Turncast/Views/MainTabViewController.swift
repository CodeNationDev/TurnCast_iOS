//
//  MainTabViewController.swift
//  Turncast
//
//  Created by Manu S. Stier on 29/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//



// En esta TabBar se cargaran las diferentes vistas de la app
//
//
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let newsVC = NewsViewController()
        newsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        
        let mainUserVC = MainUserViewController()
        mainUserVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        self.viewControllers = [newsVC, mainUserVC]
    }

}
