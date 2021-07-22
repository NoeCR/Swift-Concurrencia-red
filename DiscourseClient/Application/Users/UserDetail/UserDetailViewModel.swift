//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

protocol UserDetailViewProtocol: AnyObject {
    func userDetailFetch(userDetail: UserDetailViewStruct)
    func errorFetchingUserDetail()
    func errorUpdatingName()
    func updateNameSuccessfully()
}

struct UserDetailViewStruct {
    var userId: String?
    var nameLabel: String?
    var canEditName: Bool
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
        useCases.fetchUserDetail(username: username) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { self?.view?.errorFetchingUserDetail(); return }
                
                let userDetailStruct = UserDetailViewStruct(userId: "\(response.user.id)", nameLabel: response.user.name, canEditName: response.user.canEditName)
            
                self?.view?.userDetailFetch(userDetail: userDetailStruct)
            case .failure:
                self?.view?.errorFetchingUserDetail()
            }
            
        }
    }
    
    func updateName(name: String) {
        useCases.updateUserName(username: username, name: name) { [weak self] result in
            switch result {           
            case .success:
                self?.view?.updateNameSuccessfully()
            case .failure:
                self?.view?.errorUpdatingName()
            }
        }
    }
}
