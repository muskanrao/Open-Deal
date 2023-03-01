//
//  MainViewController.swift
//  openDeal
//
//  Created by Muskan on 18/02/23.
//

import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = MainViewController()
        let locationVC = LocationViewController()
        let cartVC = CartViewController()
        homeVC.title = "Home"
        locationVC.title = "Location"
        cartVC.title = "Cart"
        
        view.backgroundColor = .white
        
        self.setViewControllers([homeVC, locationVC, cartVC], animated: true)
        guard let items  = self.tabBar.items else{ return }
        let images = ["house","location", "cart"]
        for x  in 0...2 {
            items[x].image = UIImage(systemName: images[x])
        }
        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .black
        self.tabBar.backgroundColor = .white
        
        
        
    }
    
    
    


}
