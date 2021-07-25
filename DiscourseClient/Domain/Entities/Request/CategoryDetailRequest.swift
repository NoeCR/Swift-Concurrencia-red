//
//  CategoryDetailRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

class CategoryDetailRequest: APIRequest {
    typealias Response = CategoryDetailResponse
    
    let categoryId: Int
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/c/\(categoryId)/show.json"
    }
    
    var parameters: [String : String] {[:]}
    
    var body: [String : Any] {[:]}
    
    var headers: [String : String] {[:]}
}
