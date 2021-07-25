//
//  CategoryDetailViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

struct CategoryDetailViewStruct {
    let categoryId: String
    let categoryName: String
    let categoryColor: String
}

struct CategoryDetailErrorStruct {
    let error: String
}

protocol CategoryDetailProtocol: AnyObject {}

class CategoryDetailViewModel: ViewModel {
    typealias View = CategoryDetailProtocol
    typealias Coordinator = CategoryDetailCoordinator
    typealias UseCases = CategoryDetailUseCases
    
    var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    let categoryId: Int
    
    var onGetCategorySuccess: ((CategoryDetailViewStruct) -> ())?
    var onGetCategoryError: ((CategoryDetailErrorStruct) -> ())?
    
    init(categoryId: Int, useCases: CategoryDetailUseCases) {
        self.categoryId = categoryId
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchCategoryDetail(categoryId: categoryId) { [weak self] result in
            switch result {
            case .success(let response):
                guard let categoryDetail = response else { return }
                
                let categoryDetailStruct = CategoryDetailViewStruct(categoryId: "\(categoryDetail.category.id)", categoryName: categoryDetail.category.name, categoryColor: categoryDetail.category.color)
                
                self?.onGetCategorySuccess?(categoryDetailStruct)
            case .failure(let error):
                guard let responseError = error as? DiscourseClient.SessionApiError else {
                    self?.onGetCategoryError?(CategoryDetailErrorStruct(error: "Error fetching category detail"));
                    return
                }
                
                var message = error.localizedDescription
                
                switch responseError {
                    case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                    case .httpError(let code): message = "Error Code: \(code)"
                }
                
                self?.onGetCategoryError?(CategoryDetailErrorStruct(error: message))
            }
            
        }
    }
}
