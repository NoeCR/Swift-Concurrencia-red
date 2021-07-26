//
//  CategoryDetailViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import UIKit

class CategoryDetailVIewController: UIViewController {
    let viewModel: CategoryDetailViewModel
    
    var labelCategoryID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelCategoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Creamos un contenedor para mostrar el color de la categoría
    let categoryColorContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
    
    lazy var categoryIDStackView: UIStackView = {
        let labelCategoryIDTitle = UILabel()
        
        labelCategoryIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryIDTitle.text = "Category ID: "
        
        let categoryIDStackView = UIStackView(arrangedSubviews: [labelCategoryIDTitle, labelCategoryID])
        
        categoryIDStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryIDStackView.axis = .horizontal
        
        return categoryIDStackView
    }()
    
    lazy var categoryTitleStackView: UIStackView = {
        let labelCategoryName = UILabel()
        
        labelCategoryName.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryName.text = "Category Name: "
        
        let categoryNameStackView = UIStackView(arrangedSubviews: [labelCategoryName, labelCategoryTitle])
        
        categoryNameStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryNameStackView.axis = .horizontal
        
        return categoryNameStackView
    }()
        
    init(viewModel: CategoryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(categoryIDStackView)
        NSLayoutConstraint.activate([
            categoryIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            categoryIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
        
        view.addSubview(categoryTitleStackView)
        NSLayoutConstraint.activate([
            categoryTitleStackView.topAnchor.constraint(equalTo: categoryIDStackView.bottomAnchor, constant: 16),
            categoryTitleStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
        
        categoryColorContainer.backgroundColor = .black
        categoryColorContainer.layer.cornerRadius = 10
        
        view.addSubview(categoryColorContainer)
        // FIXME: sería necesario establecer la posición de forma responsiva
        categoryColorContainer.center = CGPoint(x: 150,
                                                y: 200)
        
        // Pruebas para establecer la posición de forma responsiva
        //        categoryColorContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        categoryColorContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //        NSLayoutConstraint.activate([
        //            categoryColorContainer.topAnchor.constraint(equalTo: categoryTitleStackView.bottomAnchor, constant: 16),
        //            categoryColorContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        //        ])
        
        //        categoryColorContainer.center = CGPoint(x: view.frame.size.width  / 2,
        //                                                y: view.frame.size.height / 2)
        // categoryColorContainer.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showLoader()
    }
    
    private func bindViewModel() {
        viewModel.onGetCategorySuccess = { [ weak self ] categoryDetailViewStruct in
            self?.hideLoader()
            self?.updateUI(categoryDetailViewStruct: categoryDetailViewStruct)
        }
        
        viewModel.onGetCategoryError = { [ weak self ] categoryDetailErrorStruct in
            self?.hideLoader()
            self?.showAlert(title: categoryDetailErrorStruct.error)
        }
    }
    
    private func updateUI(categoryDetailViewStruct: CategoryDetailViewStruct) {
        labelCategoryID.text = categoryDetailViewStruct.categoryId
        labelCategoryTitle.text = categoryDetailViewStruct.categoryName
        categoryColorContainer.backgroundColor = UIColor(hexString: categoryDetailViewStruct.categoryColor)
    }
}
