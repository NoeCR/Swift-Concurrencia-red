//
//  CategoriesViewCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation
import UIKit

class CategoriesCoordinator: Coordinator {
    var navigator: UINavigationController
    let useCases: CategoriesUseCases
    
    init(navigator: UINavigationController, categoriesUseCases: CategoriesUseCases) {
        self.navigator = navigator
        self.useCases = categoriesUseCases
    }
    
    func start() {
        let categoriesViewModel = CategoriesViewModel(useCases: useCases)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewModel)
        
        categoriesViewController.title = "Categories"
        
        categoriesViewModel.view = categoriesViewController
        categoriesViewModel.coordinator = self
        
        navigator.pushViewController(categoriesViewController, animated: false)
    }
    
    
}
