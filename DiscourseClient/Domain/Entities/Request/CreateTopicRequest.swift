//
//  CreateTopicRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import Foundation

struct CreateTopicRequest: APIRequest {
    typealias Response = CreateTopicResponse
    
    let title: String
    let raw: String
    let createdAt: String
    
    init(title: String, raw: String, createdAt: String) {
        self.title = title
        self.raw = raw
        self.createdAt = createdAt
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return ""
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {[:]}
    
    var headers: [String : String] {[:]}
    
    
}
