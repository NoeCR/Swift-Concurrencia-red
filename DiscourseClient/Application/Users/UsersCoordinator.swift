//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation
import UIKit

class UsersCoordinator: Coordinator {
    var navigator: UINavigationController
    let userUseCases: UsersUseCases
    
    init(navigator: UINavigationController, usersUseCases: UsersUseCases) {
        self.navigator = navigator
        self.userUseCases = usersUseCases
    }
    
    func start() {
        let userViewModel = UsersViewModel(useCases: userUseCases)
        let userViewController = UsersViewController(viewModel: userViewModel)
        
        userViewController.title = "Users"
        userViewModel.view = userViewController
        userViewModel.coordinator = self
        
        navigator.pushViewController(userViewController, animated: false)
    }
}
