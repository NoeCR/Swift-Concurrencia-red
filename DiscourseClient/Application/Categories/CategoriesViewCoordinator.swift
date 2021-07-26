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
    
    let dataManager = DataManager(remoteDataManager: RemoteDataManager())
    lazy var categoryDetailUsuCases = dataManager
    
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
    
    func didSelect(categoryId: Int) {
        let categoryDetailCoordinator = CategoryDetailCoordinator(navigator: navigator, categoryId: categoryId, useCases: categoryDetailUsuCases)
        
        categoryDetailCoordinator.start()
    }
    
    func onTapAddCategory() {
        let createCategoryCoordinator = CreateCategoryCoordinator(navigator: navigator, useCases: dataManager)
        
        createCategoryCoordinator.start()
    }
}
