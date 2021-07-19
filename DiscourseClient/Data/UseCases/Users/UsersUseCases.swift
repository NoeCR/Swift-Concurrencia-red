//
//  UsersUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation

protocol UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}

extension DataManager: UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllUsers(completion: completion)
    }
}

// MARK: -> User Use Cases
extension RemoteDataManager: UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        let request = UsersRequest()
        
        session.request(request: request) { result in completion(result) }
    }
}
