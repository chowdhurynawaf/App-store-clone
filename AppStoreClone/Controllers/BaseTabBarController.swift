//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by as on 6/18/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class BaseTabBarController : UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        viewControllers = [
 
createNavController(viewController: AppsPageController(), title: "Apps", image: "app"),
createNavController(viewController: TodayController(), title: "Today", image: "today"),
createNavController(viewController: AppSearchController(), title: "Search", image: "search"),
 
        
        ]
        
    }
    
    fileprivate func createNavController(viewController:UIViewController , title: String , image:String)->UIViewController {
        
        
        let navcontroller = UINavigationController(rootViewController: viewController)
        
        navcontroller.tabBarItem.title      = title
        navcontroller.tabBarItem.image      = UIImage(named: image)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title =  "\(title)"
        navcontroller.navigationBar.prefersLargeTitles = true

        return navcontroller
        
    }
    
    
}
