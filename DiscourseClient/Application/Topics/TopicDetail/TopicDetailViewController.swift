//
//  TopicDetailViewController.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 22/07/2021.
//

import UIKit

class TopicDetailsViewController: UIViewController {
    let viewModel: TopicDetatilViewModel
    
    var labelTopicID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelTopicTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var postNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var topicIDStackView: UIStackView = {
        let labelTopicIDTitle = UILabel()
        labelTopicIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTopicIDTitle.text = "Topic ID: "
        
        let topicIDStackView = UIStackView(arrangedSubviews: [labelTopicIDTitle, labelTopicID])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal
        
        return topicIDStackView
    }()
    
    lazy var topicTitleStackView: UIStackView = {
        let labelTopicName = UILabel()
        labelTopicName.numberOfLines = 0
        labelTopicName.translatesAutoresizingMaskIntoConstraints = false
        labelTopicName.text = "Topic Name: "
        
        let topicNameStackView = UIStackView(arrangedSubviews: [labelTopicName, labelTopicTitle])
        topicNameStackView.translatesAutoresizingMaskIntoConstraints = false
        topicNameStackView.axis = .horizontal
        
        return topicNameStackView
    }()
    
    lazy var postNumberStackView: UIStackView = {
        let labelPostNumber = UILabel()
        labelPostNumber.translatesAutoresizingMaskIntoConstraints = false
        labelPostNumber.text = "Number of posts: "
        
        let postNumberStackView = UIStackView(arrangedSubviews: [labelPostNumber, postNumberLabel])
        postNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        postNumberStackView.axis = .horizontal
        
        return postNumberStackView
    }()
    
    init(viewModel: TopicDetatilViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(topicIDStackView)
        NSLayoutConstraint.activate([
            topicIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        
        view.addSubview(topicTitleStackView)
        NSLayoutConstraint.activate([
            topicTitleStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicTitleStackView.topAnchor.constraint(equalTo: topicIDStackView.bottomAnchor, constant: 16),
            topicTitleStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16)
        ])
        
        view.addSubview(postNumberStackView)
        NSLayoutConstraint.activate([
            postNumberStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            postNumberStackView.topAnchor.constraint(equalTo: topicTitleStackView.bottomAnchor, constant: 16)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [ weak self ] in
            self?.showLoader()
        }
        
        // Bindeo de datos con el viewModel
        bindViewModel()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        showLoader()
//    }
    
    // Relación de datos entre el controlador y el viewModel
    private func bindViewModel() {
        // Evento que se llamara desde el viewModel al obtener la respuesta de la llamada a a API
        viewModel.onGetTopicSuccess = { [ weak self ] topicDetailViewStruct in
            self?.hideLoader()
            self?.updateUI(topicDetailViewStruct: topicDetailViewStruct)
        }
        
        viewModel.onGetTopicFail = { [ weak self ] in
            self?.hideLoader()
            self?.showAlert(title: "Error fetching topic")
        }
    }
    
    private func updateUI(topicDetailViewStruct: TopicDetailViewStruct) {
        labelTopicID.text = topicDetailViewStruct.topicId
        labelTopicTitle.text = topicDetailViewStruct.topicName
        postNumberLabel.text = topicDetailViewStruct.postsNumber
    }
}
