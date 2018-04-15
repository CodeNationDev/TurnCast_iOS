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
        newsVC.tabBarItem = UITabBarItem(title: "Noticias", image: nil, tag: 0)
        
        
        let podcastListVC = PodcastListViewController()
        podcastListVC.tabBarItem = UITabBarItem(title: "Podcasts", image: nil, tag: 1)
        
        let mainUserVC = MainUserViewController()
        mainUserVC.tabBarItem = UITabBarItem(title: "Usuario", image: nil, tag: 2)
        
        
        self.viewControllers = [newsVC, podcastListVC, mainUserVC]
    }

}
