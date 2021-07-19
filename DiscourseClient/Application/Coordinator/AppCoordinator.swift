//
//  AppCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import UIKit

// MARK: - Coordinator
protocol Coordinator {
    var navigator: UINavigationController {get}
    
    func start()
    func finish()
}


extension Coordinator {
    func finish() {
        navigator.dismiss(animated: true, completion: nil)
    }
}


class AppCoordinator: Coordinator {
    var navigator: UINavigationController = UINavigationController()
    let window: UIWindow
    let dataManager = DataManager(remoteDataManager: RemoteDataManager())
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.tintColor = .black
        
        // Initilize view controllers
        let usersNavigator = UINavigationController()
        let usersCoordinator = UsersCoordinator(navigator: usersNavigator, usersUseCases: dataManager)
        
        usersCoordinator.start()
        
        // viewcontroller of tabbar
        tabBarController.viewControllers = [usersNavigator]
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "tag")
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
