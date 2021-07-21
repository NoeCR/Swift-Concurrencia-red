//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation

struct UserDetailResponse: Codable {
    let user: UserDetail
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
}

struct UserDetail: Codable {
    let id: Int
    let username: String
    let name: String
    let canEditName: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case canEditName = "can_edit_name"
    }
}
