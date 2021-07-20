//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

struct UserDetailResponse: Codable {
    let userDetail: UserDetail
    
    enum CodingKeys: String, CodingKey {
        case userDetail = "user"
    }
}

struct UserDetail: Codable {
    let id: Int
    let username: String
    let name: String
}
