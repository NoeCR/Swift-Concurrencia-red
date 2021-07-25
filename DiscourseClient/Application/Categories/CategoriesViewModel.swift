//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

protocol CategoriesViewProtocol: AnyObject {
    func categoriesFetch()
    func errorFetchingCategories(error: String)
}

class CategoriesViewModel: ViewModel {
    typealias View = CategoriesViewProtocol
    typealias Coordinator = CategoriesCoordinator
    typealias UseCases = CategoriesUseCases
    
    var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    var categoryCellViewModels: [CategoryCellViewModel] = []
    
    init(useCases: CategoriesUseCases) {
        self.useCases = useCases
    }
    
    
    func viewDidLoad() {
        useCases.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let response):
                // Comprobamos si hay respuesta
                guard let response = response else { self?.view?.errorFetchingCategories(error: "List of categories not obtained"); return }
                // Mapeamos la respuesta con el modelo de datos
                self?.categoryCellViewModels = response.categoryList.categories.map{ CategoryCellViewModel(category: $0) }
                // Accionamos el evento para notificar a la vista
                self?.view?.categoriesFetch()
            case .failure(let error):
                // Obtenemos el error y lo intentamos convertir a un error de tipo SessionApiError
                guard let responseError = error as? DiscourseClient.SessionApiError else {
                    self?.view?.errorFetchingCategories(error: "Error fetching categories"); return }
                // Establecemos un valor por defecto al mensaje
                var message = error.localizedDescription
                // Comprobamos que tipo de SessionApiError es para definir mejor el mensaje
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error Code: \(code)"
                }
                // Emitimos el evento de error con el mensaje
                self?.view?.errorFetchingCategories(error: message)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return categoryCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoryCellViewModels.count else { return nil }
        
        return categoryCellViewModels[indexPath.row]
    }
}
