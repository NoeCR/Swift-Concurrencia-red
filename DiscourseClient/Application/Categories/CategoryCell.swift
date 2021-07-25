//
//  CategoryCell.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell {
    var viewModel: CategoryCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            textLabel?.text = viewModel.category.name
        }
    }
}
