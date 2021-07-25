//
//  CategoryDetailUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

protocol CategoryDetailUseCases {
    func fetchCategoryDetail(categoryId: Int, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ())
}

extension DataManager: CategoryDetailUseCases {
    func fetchCategoryDetail(categoryId: Int, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchCategoryDetail(categoryId: categoryId, completion: completion)
    }
}

extension RemoteDataManager: CategoryDetailUseCases{
    func fetchCategoryDetail(categoryId: Int, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        let request = CategoryDetailRequest(categoryId: categoryId)
        
        session.request(request: request) { result in completion(result) }
    }
}
