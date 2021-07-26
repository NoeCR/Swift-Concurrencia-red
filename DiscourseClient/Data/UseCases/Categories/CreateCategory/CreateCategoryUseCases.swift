//
//  CreateCategoryUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import Foundation

protocol CreateCategoryUseCases {
    func createCategory(title: String, color: String, completion: @escaping (Result<CreateCategoryResponse?, Error>) -> ())
}

extension DataManager: CreateCategoryUseCases {
    func createCategory(title: String, color: String, completion: @escaping (Result<CreateCategoryResponse?, Error>) -> ()) {
        remoteDataManager.createCategory(title: title, color: color, completion: completion)
    }
}

extension RemoteDataManager: CreateCategoryUseCases {
    func createCategory(title: String, color: String, completion: @escaping (Result<CreateCategoryResponse?, Error>) -> ()) {
        let request = CreateCategoryRequest(title: title, color: color)
        
        session.request(request: request) { result in completion(result)}
    }
}
