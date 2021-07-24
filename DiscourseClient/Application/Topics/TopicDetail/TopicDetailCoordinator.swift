//
//  TopicDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 22/07/2021.
//

import UIKit

class TopicDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    let topicId: Int
    let useCases: TopicDetailUseCases
    
    
    init(navigator: UINavigationController, topicId: Int, useCases: TopicDetailUseCases) {
        self.navigator = navigator
        self.topicId = topicId
        self.useCases = useCases
    }
    
    func start() {
        let topicDetailViewModel = TopicDetatilViewModel(topicId: topicId, useCases: useCases)
        let topicDetailViewController = TopicDetailsViewController(viewModel: topicDetailViewModel)
        
        topicDetailViewController.title = "Topic Detail"
        // topicDetailViewModel.view = topicDetailViewController - No usaremos el protocolo para la comunicación entre capas
        topicDetailViewModel.coordinator = self
        
        navigator.pushViewController(topicDetailViewController, animated: false)
        
    }
    
    
    
}
