//
//  CategoriesUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

protocol CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}

extension DataManager: CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllCategories(completion: completion)
    }
}

extension RemoteDataManager: CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        let request = CategoriesRequest()
        
        session.request(request: request) { result in completion(result) }
    }
}
