//
//  CreateCategoryRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import Foundation

class CreateCategoryRequest: APIRequest {
    typealias Response = CreateCategoryResponse
    
    let title: String
    let color: String
    
    init(title: String, color: String) {
        self.title = title
        self.color = color
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/categories.json"
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {
        return ["name": title, "color": color, "text_color": color]
    }
    
    var headers: [String : String] {[:]}
}

// curl -i -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"name\":\"New Category\,\"color\":\"FFFFFF\"\"tet_color\":\"FFFFFF\}" -X POST https://mdiscourse.keepcoding.io/categories.json

