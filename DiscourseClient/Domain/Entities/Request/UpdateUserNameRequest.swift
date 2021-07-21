//
//  UpdateUserNameRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 21/07/2021.
//

import Foundation

class UpdateNameRequest: APIRequest {
    typealias Response = UpdateNameResponse
            
    let username: String
    let name: String
    init(username: String, name: String) {
        self.username = username
        self.name = name
    }
    
    var method: Method {
        return .PUT
    }
    
    var path: String {
        return "users/\(self.username)"
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {[ "name": self.name ]}
    
    var headers: [String : String] {[:]}
}
