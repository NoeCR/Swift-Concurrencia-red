//
//  CategoriesViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation
import UIKit

class CategoriesViewController: UIViewController {
    let viewModel: CategoriesViewModel
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        
        return table
    }()
    
    
    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            [unowned self] in self.showLoader()
        }
    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
            let cellViewModel = viewModel.cellViewModel(at: indexPath)
            
            let color = UIColor(hexString: cellViewModel?.category.color ?? "FFFFFF")

            cell.viewModel = cellViewModel
            cell.backgroundColor = color
                        
            return cell
        }
        fatalError()
    }
}

extension CategoriesViewController: CategoriesViewProtocol {
    func categoriesFetch() {
        hideLoader()
        tableView.reloadData()
    }
    
    func errorFetchingCategories(error: String) {
        hideLoader()
        showAlert(title: error)
    }
}

extension CategoriesViewController: UITableViewDelegate {}
