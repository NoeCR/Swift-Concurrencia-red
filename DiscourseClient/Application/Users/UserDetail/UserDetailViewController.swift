//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 20/07/2021.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    lazy var labelUserIDValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userIDStackVIew: UIStackView = {
        let labelUserId = UILabel()
        labelUserId.translatesAutoresizingMaskIntoConstraints = false
        labelUserId.text = "User ID: "
        
        let stack = UIStackView(arrangedSubviews: [labelUserId, labelUserIDValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    lazy var labelNameValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameStackVIew: UIStackView = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "User Name: "
        
        let stack = UIStackView(arrangedSubviews: [labelName, labelNameValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    lazy var updateNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(updateNameButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var textFieldUserName: UITextField = {
        let textFieldUserName = UITextField()
        textFieldUserName.borderStyle = .line
        // textFieldUserName.translatesAutoresizingMaskIntoConstraints = false
        // textFieldUserName.frame.size.width = 100
        
        return textFieldUserName
    }()
    
    lazy var newUserNameStackVIew: UIStackView = {
        let labelNewName = UILabel()
        labelNewName.translatesAutoresizingMaskIntoConstraints = false
        labelNewName.text = "New User Name: "
        
        let stack = UIStackView(arrangedSubviews: [labelNewName, textFieldUserName])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // Añadimos los elementos y establecemos las constrains
        view.addSubview(userIDStackVIew)
        NSLayoutConstraint.activate([
            userIDStackVIew.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
//            userIDStackVIew.topAnchor.constraint(equalTo: navigationController?.navigationBar.bottomAnchor ?? view.topAnchor, constant: navigationController?.navigationBar.bottomAnchor == nil ? 128 : 1)
            userIDStackVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 128)
        ])
        
        view.addSubview(nameStackVIew)
        NSLayoutConstraint.activate([
            nameStackVIew.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameStackVIew.topAnchor.constraint(equalTo: userIDStackVIew.bottomAnchor, constant: 32)
        ])
        
        view.addSubview(newUserNameStackVIew)
        NSLayoutConstraint.activate([
            newUserNameStackVIew.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            newUserNameStackVIew.topAnchor.constraint(equalTo: nameStackVIew.bottomAnchor, constant: 32),
            //newUserNameStackVIew.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(updateNameButton)
        NSLayoutConstraint.activate([
            updateNameButton.topAnchor.constraint(equalTo: newUserNameStackVIew.bottomAnchor, constant: 32),
            updateNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateNameButton.heightAnchor.constraint(equalToConstant: 40),
            updateNameButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            self.showLoader()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoader()
    }
    
    private func updateData(userDetail: UserDetailViewStruct) {
        labelUserIDValue.text = userDetail.userId
        labelNameValue.text = userDetail.nameLabel
        
        updateNameButton.isHidden = !userDetail.canEditName
        newUserNameStackVIew.isHidden = !userDetail.canEditName
        
        hideLoader()
    }
    
    private func showErrorFetchingUserDetail() {
        hideLoader()
        showAlert(title: "Error fetching user detail", message: "")
    }
    
    @objc func updateNameButtonTapped(){
        showLoader()
        guard let name = textFieldUserName.text, !name.isEmpty else { showAlert(title: "Error in textfield"); return }
                
        viewModel.updateName(name: name)
    }
    
    private func showErrorUpdatingName() {
        hideLoader()
        showAlert(title: "Error updating name")
    }
    
    private func showSuccessUpdatingUserName() {
        hideLoader()
        showAlert(title: "The user name has been updated")
    }
}

extension UserDetailViewController: UserDetailViewProtocol {
    func updateNameSuccessfully() {
        showSuccessUpdatingUserName()
    }
    
    func errorUpdatingName() {
        showErrorUpdatingName()
    }
        
    func userDetailFetch(userDetail: UserDetailViewStruct) {
        updateData(userDetail: userDetail)
    }
    
    func errorFetchingUserDetail() {
        showErrorFetchingUserDetail()
    }
}

