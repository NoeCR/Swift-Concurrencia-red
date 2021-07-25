//
//  CreateTopicViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 24/07/2021.
//

import UIKit

class CreateTopicViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.placeholder = "Insert topic title"
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
    
    let viewModel: CreateTopicViewModel
    
    init(viewModel: CreateTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
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
        // Comprobamos que el textFiel tenga valor en el campo text
        guard let title = textField.text, !title.isEmpty else {return}
        // Si contiene valor mostramos el loader y llamamos al viewModel
        self.showLoader()
        viewModel.onTapSubmitButton(title)
    }
    
    private func bindViewModel() {
        viewModel.onCreateTopicSuccess = {[weak self] in
            self?.hideLoader()
            self?.showAlert(title: "Topic created successfully")
        }
        
        viewModel.onCreateTopicError = {[weak self] error in
            self?.hideLoader()
            self?.showAlert(title: error)
        }
    }
}

extension CreateTopicViewController: CreateTopicProtocol {}
