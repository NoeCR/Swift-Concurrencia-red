//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 22/07/2021.
//

import Foundation

// Estructura de datos que devolvera el clousure onGetTopicSuccess
struct TopicDetailViewStruct {
    let topicId: String
    let topicName: String
    let postsNumber: String
    let topicCanBeDeleted: Bool
}

protocol TopicDetailProtocol: AnyObject {}

class TopicDetatilViewModel: ViewModel {
    typealias View = TopicDetailProtocol
    typealias Coordinator = TopicDetailCoordinator
    typealias UseCases = TopicDetailUseCases
    
    // No se útiliza en el casos de comunicación con clousures, pero se debe implementar para
    // cumplir con el protocolo
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    let topicId: Int

    // clousure para la comunicación entre capas
    // La vista estara escuchando al clousure
    var onGetTopicSuccess: ((TopicDetailViewStruct) -> ())?
    
    // Estructura del clousure
    // () = valor/es de retorno
    // -> () = bloque de código que se ejecutara
    var onGetTopicFail: (() -> ())?

    var onDeleteTopicSuccess: (() -> ())?
    var onDeleteTopicFail: (() -> ())?
    
    init(topicId: Int, useCases: TopicDetailUseCases) {
        self.topicId = topicId
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchTopicDetail(topicId: topicId) {[weak self] result in
            switch result {
            case .success(let response):
                guard let topicDetail = response else { return }
                
                let topicDetailViewStruct = TopicDetailViewStruct(topicId: "\(topicDetail.id)", topicName: topicDetail.title, postsNumber: "\(topicDetail.postsCount)", topicCanBeDeleted: topicDetail.details.canDelete ?? false)
                
                self?.onGetTopicSuccess?(topicDetailViewStruct)
                
            case .failure:
                self?.onGetTopicFail?()
            }
        }
    }
    
    func onTapDeleteButton(topicId: Int) {
        let deleteTopicUseCases: DeleteTopicUseCases = DataManager(remoteDataManager: RemoteDataManager())
        
        deleteTopicUseCases.deleteTopic(topicId: topicId) {[weak self] result in
            print(result)
            switch result {
            case .success:
                self?.onDeleteTopicSuccess?()
            case .failure:
                self?.onDeleteTopicFail?()
            }
        }
        
    }
    
    func onNavigateToParent() {
        self.coordinator?.close()
    }
}
