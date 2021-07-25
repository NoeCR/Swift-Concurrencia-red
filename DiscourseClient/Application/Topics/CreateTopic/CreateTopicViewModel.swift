//
//  CreateTopicViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import Foundation

protocol CreateTopicProtocol: AnyObject {
    
}

class CreateTopicViewModel: ViewModel {
    typealias View = CreateTopicProtocol
    typealias Coordinator = CreateTopicCoordinator
    typealias UseCases = CreateTopicUseCases
    
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    // Clousures dfinition
    var onCreateTopicSuccess: (() -> ())?
    
    var onCreateTopicError: ((String) -> ())?
    
    init(useCases: CreateTopicUseCases) {
        self.useCases = useCases
    }
    
    func onTapSubmitButton(_ title: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let createdAt = dateFormatter.string(from: Date())
        let raw = "\(createdAt)\(title)"
        
        useCases.createTopic(title: title, raw: raw, createdAt: createdAt) {
            [weak self] result in
            switch result {
            case .success:
                self?.onCreateTopicSuccess?()
            case .failure(let error):
                guard let responseError = error as? DiscourseClient.SessionApiError else { self?.onCreateTopicError?("Error creating topic"); return }
                
                var message = error.localizedDescription
                
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error Code: \(code)"
                }
                
                self?.onCreateTopicError?(message)
            }
            
        }
    }
}
