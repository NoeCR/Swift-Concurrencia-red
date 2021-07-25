//
//  DeleteTopicRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

class DeleteTopicRequest: APIRequest {
    typealias Response = DeleteTopicResponse
    
    let topicId: Int
    
    init(topicId: Int) {
        self.topicId = topicId
    }
    
    var method: Method {
        return .DELETE
    }
    
    var path: String {
        return "/t/\(topicId).json"
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {[:]}
    
    var headers: [String : String] {[:]}
    
    
}
