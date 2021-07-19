//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.view = self
            textLabel?.text = viewModel.textLabel
            imageView?.image = viewModel.userImage
        }
    }
}

extension UserCell: UserCellViewProtocol {
    func userImageFetched() {
        imageView?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
