//
//  CreateCategoryViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import UIKit

class CreateCategoryViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.placeholder = "Insert category title"
            textField?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.setTitle("Create", for: .normal)
            submitButton.backgroundColor = .gray
            submitButton.alpha = 0.5
            submitButton.setTitleColor(.black, for: .normal)
            submitButton.layer.cornerRadius = 10
            submitButton.isEnabled = false
        }
    }
    
    @IBOutlet weak var defaultImage: UIImageView! {
        didSet {
            defaultImage.load(url: URL(string: "https://t3.ftcdn.net/jpg/00/96/32/68/360_F_96326822_uhFNw3ryDWhGYcj4CX8stEs4WfCiP1tA.jpg")! )
        }
    }
    
    let viewModel: CreateCategoryViewModel
    
    init(viewModel: CreateCategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func textFieldDidChange() {
        if ((textField.text?.isEmpty) == Optional(false)) {
            submitButton.isEnabled = true
            submitButton.backgroundColor = .green
            submitButton.alpha = 1.0
        }
        else {
            submitButton.backgroundColor = .gray
            submitButton.alpha = 0.5
            submitButton.isEnabled = false
        }
    }
    
    @IBAction func onTapCreateButton() {
        guard let title = textField.text, !title.isEmpty else { return }
        
        self.showLoader()
        
        viewModel.onTapCreateCategoryButton(title)
    }
        
    private func showCategoryCreatedSuccessfully() {
        hideLoader()
        showAlert(title: "Category created successfully!")
    }
    
    private func showCategoryCreatedError(error: String) {
        hideLoader()
        showAlert(title: error)
    }
}

extension CreateCategoryViewController: CreateCategoryProtocol{
    func categoryCreatedSuccessfully() {
        self.showCategoryCreatedSuccessfully()
    }
    
    func categoryCreatedError(error: String) {
        self.showCategoryCreatedError(error: error)
    }
}

