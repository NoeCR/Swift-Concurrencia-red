//
//  ViewModel.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation

protocol ViewModel {
    // La vista será un protocolo
    associatedtype View
    // Será el propio coordinator
    associatedtype Coordinator
    // Serán los casos de uso
    associatedtype UseCases
    
    
    var view: View? { get } // weak - para poder destruir l objeto
    var coordinator: Coordinator? { get }
    var useCases: UseCases { get }
}
