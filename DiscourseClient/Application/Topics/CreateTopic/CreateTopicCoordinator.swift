//
//  CreateTopicCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import UIKit

class CreateTopicCoordinator: Coordinator {
    var navigator: UINavigationController
    let useCases: CreateTopicUseCases
    
    init(navigator: UINavigationController, createTopicUseCases: CreateTopicUseCases) {
        self.navigator = navigator
        self.useCases = createTopicUseCases
    }
    
    func start() {
        let createTopicViewModel = CreateTopicViewModel(useCases: useCases)
        let createTopicViewController = CreateTopicViewController(viewModel: createTopicViewModel)
        
        createTopicViewController.title = "Create new topic"
        createTopicViewModel.view = createTopicViewController
        createTopicViewModel.coordinator = self
        
        navigator.pushViewController(createTopicViewController, animated: false)
    }
    
    
}
