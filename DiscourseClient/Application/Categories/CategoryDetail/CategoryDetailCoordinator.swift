//
//  CategoryDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation
import UIKit

class CategoryDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    let categoryId: Int
    let useCases: CategoryDetailUseCases
    
    init(navigator: UINavigationController, categoryId: Int, useCases: CategoryDetailUseCases) {
        self.navigator = navigator
        self.categoryId = categoryId
        self.useCases = useCases
    }
    
    func start() {
        let categoryDetailViewModel = CategoryDetailViewModel(categoryId: categoryId, useCases: useCases)
        let categoryDetailViewController = CategoryDetailVIewController(viewModel: categoryDetailViewModel)
        
        categoryDetailViewController.title = "Category Detail"
        categoryDetailViewModel.coordinator = self
        
        navigator.pushViewController(categoryDetailViewController, animated: false)
    }
}
