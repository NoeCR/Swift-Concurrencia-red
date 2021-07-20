//
//  UserDetailRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

class UserDetailRequest: APIRequest {
    typealias Response = UserDetailResponse

    var method: Method {
        return .GET
    }
    
    var path: String {
        // return "/u/\(username).json"
        return ""
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
