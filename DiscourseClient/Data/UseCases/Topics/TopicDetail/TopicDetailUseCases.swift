//
//  TopicDetailUseCases.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import Foundation

protocol TopicDetailUseCases {
    // @escaping - Se implementa para cuando la request finalice devolver los datos
    func fetchTopicDetail(topicId: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ())
}

extension DataManager: TopicDetailUseCases {
    func fetchTopicDetail(topicId: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchTopicDetail(topicId: topicId, completion: completion)
    }
}

extension RemoteDataManager: TopicDetailUseCases {
    func fetchTopicDetail(topicId: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ()) {
        let reuqest = TopicDetailRequest(topicId: topicId)
        
        session.request(request: reuqest) { result in completion(result) }
    }
}
