//
//  SceneDelegate.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 09.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = MainTabBarController()
            window?.makeKeyAndVisible()
        }


}

