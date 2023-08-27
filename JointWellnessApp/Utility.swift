//
//  Utility.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 27/08/2023.
//

import Foundation
import UIKit

class Utility {
    static func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        
        homeNavVC.tabBarItem.image = UIImage(systemName: "house")
        homeNavVC.tabBarItem.title = "Home"
        
        tabBarController.viewControllers = [homeNavVC]
        
        return tabBarController
    }
}
