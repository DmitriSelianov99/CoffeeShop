//
//  MainTabBarController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 20.11.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupItems()
    }
    

    private func setupTabBar(){
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialOrange
        tabBar.unselectedItemTintColor = .specialUnselectedItem
        tabBar.layer.cornerRadius = 24
    }
    
    private func setupItems(){
        let mainVC = MainViewController()
        let likedVC = LikedViewController()
        let basketVC = MainViewController()
        let notificationVC = MainViewController()
        
        setViewControllers([mainVC, likedVC, basketVC, notificationVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(named: "home")
        items[1].image = UIImage(named: "heart")
        items[2].image = UIImage(named: "bag")
        items[3].image = UIImage(named: "notification")
        
        
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    
}
