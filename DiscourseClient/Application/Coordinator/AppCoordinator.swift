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
        
        let topicsNavigator = UINavigationController()
        let topicsCoordinator = TopicsCoordinator(navigator: topicsNavigator, topicUseCases: dataManager)
        
        topicsCoordinator.start()
        
        let categoriesNavigator = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(navigator: categoriesNavigator, categoriesUseCases: dataManager)

        categoriesCoordinator.start()
        
        // viewcontroller of tabbar
        // Añadimos los navigators al tab
        tabBarController.viewControllers = [usersNavigator, topicsNavigator, categoriesNavigator]
        // Establecemos una imagen para cada uno de los elementos del tab bar
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "tag")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "list.dash")
        tabBarController.tabBar.items?[2].image = UIImage(systemName: "square.and.arrow.up.on.square.fill")
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
