//
//  CreateTopicViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import UIKit

class CreateTopicViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    let viewModel: CreateTopicViewModel
    
    init(viewModel: CreateTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        // view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapSubmitButton(_ sender: Any) {
        
    }
}


extension CreateTopicViewController: CreateTopicProtocol {}
