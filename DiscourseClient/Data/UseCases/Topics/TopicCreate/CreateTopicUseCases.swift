//
//  CreateTopicUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import Foundation

protocol CreateTopicUseCases {
    func createTopic(title: String, raw: String, createdAt: String, completion: @escaping ((Result<CreateTopicResponse?, Error>) -> ()))
}

extension DataManager: CreateTopicUseCases {
    func createTopic(title: String, raw: String, createdAt: String, completion: @escaping ((Result<CreateTopicResponse?, Error>) -> ())) {
        remoteDataManager.createTopic(title: title, raw: raw, createdAt: createdAt, completion: completion)
    }
}

extension RemoteDataManager: CreateTopicUseCases {
    func createTopic(title: String, raw: String, createdAt: String, completion: @escaping ((Result<CreateTopicResponse?, Error>) -> ())) {
        let request = CreateTopicRequest(title: title, raw: raw, createdAt: createdAt)
            
        session.request(request: request) { result in completion(result)}
    }
}
