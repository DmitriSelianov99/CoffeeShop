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
        delegate = self
    }
    

    private func setupTabBar(){
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialOrange
        tabBar.unselectedItemTintColor = .specialUnselectedItem
        tabBar.layer.cornerRadius = 24
        tabBar.frame.size.height = 99
    }
    
    private func setupItems(){
        let mainVC = MainViewController()
        let likedVC = LikedViewController()
        let basketVC = OrderViewController()
        let notificationVC = DeliveryViewController()
        
        setViewControllers([mainVC, likedVC, basketVC, notificationVC], animated: true)
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(named: "home")
        items[1].image = UIImage(named: "heart")
        items[2].image = UIImage(named: "bag")
        items[3].image = UIImage(named: "notification")
        
        
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is OrderViewController || viewController is DeliveryViewController {
            tabBar.isHidden = true
        } else {
            tabBar.isHidden = false
        }
        return true
    }
}
