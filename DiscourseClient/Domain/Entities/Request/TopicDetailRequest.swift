//
//  TopicDetailRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import Foundation

struct TopicDetailRequest: APIRequest {
    typealias Response = TopicDetailResponse
    
    let topicId: Int
    init(topicId: Int) {
        self.topicId = topicId
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/t/\(topicId).json"
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {[:]}
    
    var headers: [String : String] {[:]}
    
    
}
