//
//  CreateCategoryCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import UIKit

class CreateCategoryCoordinator: Coordinator {
    var navigator: UINavigationController
    let useCases: CreateCategoryUseCases
    
    init(navigator: UINavigationController, useCases: CreateCategoryUseCases) {
        self.navigator = navigator
        self.useCases = useCases
    }
    
    func start() {
        let createCategoryViewModel = CreateCategoryViewModel(useCases: useCases)
        let createCategoryViewController = CreateCategoryViewController(viewModel: createCategoryViewModel)
        
        createCategoryViewController.title = "Add new category"
        createCategoryViewModel.view = createCategoryViewController
        createCategoryViewModel.coordinator = self
        
        navigator.present(createCategoryViewController, animated: true)
    }
}

