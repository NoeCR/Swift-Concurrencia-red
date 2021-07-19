//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation

protocol UsersViewProtocol: AnyObject {
    func usersFetch()
    func errorFetchingUsers()
}

class UsersViewModel: ViewModel {
    typealias View = UsersViewProtocol
    typealias Coordinator = UsersCoordinator
    typealias UseCases = UsersUseCases
    
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    // Colección en la que añadiremos la respuesta
    var userCellViewModels: [UserCellViewModel] = []
    
    init(useCases: UsersUseCases) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchAllUsers { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { self?.view?.errorFetchingUsers(); return }
                self?.userCellViewModels = response.directoryItems.map{ UserCellViewModel(user: $0.user) }
                self?.view?.usersFetch()
            case .failure:
                self?.view?.errorFetchingUsers()
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return userCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < userCellViewModels.count else { return nil }
        return userCellViewModels[indexPath.row]
    }
    
}
