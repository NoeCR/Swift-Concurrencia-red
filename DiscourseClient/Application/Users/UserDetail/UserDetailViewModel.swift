//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

protocol UserDetailViewProtocol: AnyObject {
    func userDetailFetch()
    func errorFetchingUserDetail()
}

class UserDetailViewModel: ViewModel {
    typealias View = UserDetailViewProtocol
    typealias Coordinator = UserDetailCoordinator
    typealias UseCases = UserDetailUseCases
  
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    let username: String
    
    init(username: String, useCases: UserDetailUseCases) {
        self.username = username
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchUserDetail { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { self?.view?.errorFetchingUserDetail(); return }
            
                self?.view?.userDetailFetch()
            case .failure:
                self?.view?.errorFetchingUserDetail()
            }
            
        }
    }
}
