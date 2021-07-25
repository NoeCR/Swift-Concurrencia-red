//
//  TopicsViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 22/07/2021.
//

import Foundation

// Comunicación del ViewModel con la view
protocol TopicsViewProtocol: AnyObject {
    func topicsFetched()
    func errorFetchingTopics()
}

class TopicsViewModel: ViewModel {
    typealias View = TopicsViewProtocol
    typealias Coordinator = TopicsCoordinator
    typealias UseCases = TopicsUseCases
    
    
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    var topicCellViewModels: [TopicCellViewModel] = [];
    
    init(useCases: TopicsUseCases) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchAllTopics { [weak self] result in
            switch result {
            case .success(let response):
                guard let topics = response?.topicList.topics else {return}
                
                self?.topicCellViewModels = topics.map{ TopicCellViewModel(topic: $0) }
                
                self?.view?.topicsFetched()
            case .failure:
                self?.view?.errorFetchingTopics()
            }
        }
        
    }
    
    func numberOfRows(in: Int) -> Int {
        return topicCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TopicCellViewModel? {
        // Comprobamos que el indice de selección tenga un valor que este dentro del tamaño de la colección
        guard indexPath.row < topicCellViewModels.count else { return nil }
        
        return topicCellViewModels[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        coordinator?.didSelectTopic(topic: topicCellViewModels[indexPath.row].topic)
    }
    
    func onTapAddButton() {
        coordinator?.onTapAddButton()
    }
}
