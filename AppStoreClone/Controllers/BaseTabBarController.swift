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
        

//
//        let todayController = UIViewController()
//        todayController.view.backgroundColor = .white
//        todayController.navigationItem.title =  "Today"
//
//        let todayNavcontroller = UINavigationController(rootViewController: todayController)
//        todayNavcontroller.tabBarItem.title = "Today"
//        todayNavcontroller.navigationBar.prefersLargeTitles = true
//        todayNavcontroller.tabBarItem.image = #imageLiteral(resourceName: "today")
//
//
//
//        let redViewController = UIViewController()
//        redViewController.view.backgroundColor = .white
//        redViewController.navigationItem.title = "Apps"
//
//
//        let redNavController = UINavigationController(rootViewController: redViewController)
//        redNavController.tabBarItem.title = "Apps"
//        redNavController.navigationBar.prefersLargeTitles = true
//        redNavController.tabBarItem.image = #imageLiteral(resourceName: "app")
        
        
//
//        let blueViewController = UIViewController()
//        blueViewController.view.backgroundColor = .white
//        blueViewController.navigationItem.title = "Search"
//
//
//        let blueNavCOntroller = UINavigationController(rootViewController: blueViewController)
//        blueNavCOntroller.tabBarItem.title = "Search"
//        blueNavCOntroller.navigationBar.prefersLargeTitles = true
//        blueNavCOntroller.tabBarItem.image = UIImage(named: "search")
//
        
        
        
        
        viewControllers = [
        //todayNavcontroller,
        //redNavController,
    createNavController(viewController: TodayController(), title: "Today", image: "today"),
    createNavController(viewController: AppsPageController(), title: "Apps", image: "app"),
    createNavController(viewController: AppSearchController(), title: "Search", image: "search")

        
        
        
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
