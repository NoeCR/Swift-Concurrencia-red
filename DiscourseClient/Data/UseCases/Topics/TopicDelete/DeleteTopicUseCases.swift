//
//  DeleteTopicUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

protocol DeleteTopicUseCases {
    func deleteTopic(topicId: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ())
}

extension DataManager: DeleteTopicUseCases {
    func deleteTopic(topicId: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        remoteDataManager.deleteTopic(topicId: topicId, completion: completion)
    }
}

extension RemoteDataManager: DeleteTopicUseCases {
    func deleteTopic(topicId: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        let request = DeleteTopicRequest(topicId: topicId)
        
        session.request(request: request) { result in completion(result) }
    }
    
    
}
