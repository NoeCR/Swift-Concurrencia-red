//
//  UserDetailUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

protocol UserDetailUseCases {
    func fetchUserDetail(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ())
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateNameResponse?, Error>) -> ())
}


extension DataManager: UserDetailUseCases {
    // MARK: -> Get all Users
    func fetchUserDetail(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchUserDetail(username: username, completion: completion)
    }
    
    // MARK: -> Update user name
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateNameResponse?, Error>) -> ()) {
        remoteDataManager.updateUserName(username: username, name: name, completion: completion)
    }
}

extension RemoteDataManager: UserDetailUseCases {
    // MARK: -> Get all Users
    func fetchUserDetail(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        let request = UserDetailRequest(username: username)
        
        session.request(request: request) { result in completion(result) }
    }
    
    // MARK: -> Update User name
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateNameResponse?, Error>) -> ()) {
        let request = UpdateNameRequest(username: username, name: name)
        
        session.request(request: request) { result in completion(result) }
    }
}

