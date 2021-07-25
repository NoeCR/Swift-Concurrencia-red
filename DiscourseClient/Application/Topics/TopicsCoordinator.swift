//
//  TopicsCoordinator.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 22/07/2021.
//

import Foundation
import UIKit


class TopicsCoordinator: Coordinator {
    var navigator: UINavigationController
    let topicsUseCases: TopicsUseCases
    
    let dataManager = DataManager(remoteDataManager: RemoteDataManager())
    
    required init(navigator: UINavigationController, topicUseCases: TopicsUseCases) {
        self.navigator = navigator
        self.topicsUseCases = topicUseCases
    }
    
    func start() {
        let topicsViewModel = TopicsViewModel(useCases: topicsUseCases)
        let topicsViewController = TopicsViewController(viewModel: topicsViewModel)
        
        topicsViewController.title = "Topics"
        topicsViewModel.view = topicsViewController
        topicsViewModel.coordinator = self
        // Añade la vista a la navegación
        navigator.pushViewController(topicsViewController, animated: false)
    }
    
    func didSelectTopic(topic: Topic) {
        let topicDetailCoordinator = TopicDetailCoordinator(navigator: navigator, topicId: topic.id, useCases: dataManager)
        
        topicDetailCoordinator.start()
    }
    
    func onTapAddButton() {
        let topicCreateCoordinator = CreateTopicCoordinator(navigator: navigator, useCases: dataManager)
        
        topicCreateCoordinator.start()
    }
}
