//
//  CreateCategoryViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import Foundation
import UIKit

protocol CreateCategoryProtocol: AnyObject {
    func categoryCreatedSuccessfully()
    func categoryCreatedError(error: String)
}
 
class CreateCategoryViewModel: ViewModel {
    typealias View = CreateCategoryProtocol
    typealias Coordinator = CreateCategoryCoordinator
    typealias UseCases = CreateCategoryUseCases
    
    var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    init(useCases: CreateCategoryUseCases) {
        self.useCases = useCases
    }
    
    func onTapCreateCategoryButton(_ title: String) {
        // let color = UIColor.random()
        // let hexColor = UIColor.hexStringFromColor(color) - It does not work as expected
        let hexColor = "49d9e9"
        
        useCases.createCategory(title: title, color: hexColor) { [weak self] result in
            print(result)
            switch result {
            case .success: self?.view?.categoryCreatedSuccessfully()
            case .failure(let error):
                guard let responseError = error as? DiscourseClient.SessionApiError else {self?.view?.categoryCreatedError(error: "Error creating cateogry"); return }
                
                var message = error.localizedDescription
                
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error Code: \(code)"
                }
                
                self?.view?.categoryCreatedError(error: message)
            }
        }
    }
}
