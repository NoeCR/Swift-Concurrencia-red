//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    let userDetailViewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel) {
        self.userDetailViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showErrorFetchingUserDetail() {
        showAlert(title: "Error fetching user detail", message: "")
    }
    
}

extension UserDetailViewController: UserDetailViewProtocol {
    func userDetailFetch() {
        hideLoader()
        // TODO: make somethign with data
    }
    
    func errorFetchingUserDetail() {
        hideLoader()
        showErrorFetchingUserDetail()
    }
}

