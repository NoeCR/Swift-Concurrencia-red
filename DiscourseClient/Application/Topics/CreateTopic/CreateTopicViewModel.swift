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
    
    init(useCases: CreateTopicUseCases) {
        self.useCases = useCases
    }
}
