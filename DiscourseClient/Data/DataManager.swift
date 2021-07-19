//
//  DataManager.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation

class DataManager {
    let remoteDataManager: RemoteDataManager
    
    init(remoteDataManager: RemoteDataManager) {
        self.remoteDataManager = remoteDataManager
    }
}
