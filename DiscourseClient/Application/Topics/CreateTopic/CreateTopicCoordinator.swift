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
    
    init(navigator: UINavigationController, useCases: CreateTopicUseCases) {
        self.navigator = navigator
        self.useCases = useCases
    }
    
    func start() {
        let createTopicViewModel = CreateTopicViewModel(useCases: useCases)
        let createTopicViewController = CreateTopicViewController(viewModel: createTopicViewModel)
        
        createTopicViewController.title = "Create new topic"
        // Le damos el view al viewmodel aunque no lo usaremos, ya que lo implementaremos con clousures
        createTopicViewModel.view = createTopicViewController
        createTopicViewModel.coordinator = self
        
        
        // Para crear la pantalla de forma modal
        let navigationController = UINavigationController(rootViewController: createTopicViewController)
        navigator.present(navigationController, animated: false, completion: nil)
    }
    
    
}
