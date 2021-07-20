//
//  UserDetailUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

protocol UserDetailUseCases {
    func fetchUserDetail(completion: @escaping (Result<UserDetailResponse?, Error>) -> ())
}

extension DataManager: UserDetailUseCases {
    func fetchUserDetail(completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchUserDetail(completion: completion)
    }
}

extension RemoteDataManager: UserDetailUseCases {
    func fetchUserDetail(completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        let request = UserDetailRequest()
        
        session.request(request: request) { result in completion(result) }
    }
}
