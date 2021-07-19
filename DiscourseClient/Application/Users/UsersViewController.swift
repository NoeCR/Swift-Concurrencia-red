//
//  UsersViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation
import UIKit

class UsersViewController: UIViewController {
    
    let viewModel: UsersViewModel
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        
        return  table
    }()
    // Inicializador
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    // Inicializador requerido
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func loadView() {
        // Inicializamos la vista
        view = UIView()
        // Le damos un color de fondo
        view.backgroundColor = .white
        // Añadimoa la tabla
        view.addSubview(tableView)
        // Le damos las dimensiones en función de la vista
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func showErrorFetchingUsers() {
        showAlert(title: "Error fetching users", message: "")
    }
    
}

extension UsersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell {
            let cellViewModel = viewModel.cellViewModel(at: indexPath)
            
            cell.viewModel = cellViewModel
            
            return cell
        }
        fatalError()
    }
}

extension UsersViewController: UsersViewProtocol {
    func usersFetch() {
        tableView.reloadData()
    }
    
    func errorFetchingUsers() {
        showErrorFetchingUsers()
    }
}

extension UsersViewController: UITableViewDelegate {
    
}


