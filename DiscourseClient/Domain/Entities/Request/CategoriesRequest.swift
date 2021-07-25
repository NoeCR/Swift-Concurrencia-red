//
//  CategoriesRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

class CategoriesRequest: APIRequest {
    typealias Response = CategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {[:]}
    
    var headers: [String : String] {[:]}
}
