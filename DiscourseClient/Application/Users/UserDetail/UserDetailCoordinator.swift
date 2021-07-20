//
//  UserDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import UIKit


class UserDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    let username: String
    let useCases: UserDetailUseCases
    
    
    init(navigator: UINavigationController, username: String, useCases: UserDetailUseCases) {
        self.navigator = navigator
        self.username = username
        self.useCases = useCases
    }
    
    func start() {
        let userDetailViewModel = UserDetailViewModel(username: username, useCases: useCases)
        let userDetailViewController = UserDetailViewController(viewModel: userDetailViewModel)
        
        userDetailViewModel.view = userDetailViewController
        userDetailViewModel.coordinator = self
        userDetailViewController.title = username
        
        navigator.pushViewController(userDetailViewController, animated: true)
    }
    
    
}
