//
//  APIRequest.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation

enum Method: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol APIRequest {
    associatedtype Response: Codable
    
    var method: Method { get }
    var path: String { get }
    var parameters: [String:String] { get }
    var body: [String:Any] { get }
    var headers: [String:String] { get }
}

extension APIRequest {
    var apiURL: String {
        return "https://mdiscourse.keepcoding.io"
    }
    
    var baseURL: URL {
        guard let baseURL = URL(string: apiURL) else { fatalError() }
        
        return baseURL
    }
    
    func requestWithBaseURL() -> URLRequest {
        // Definimos la URL
        let url = baseURL.appendingPathComponent(path)
        // nos aseguramos de inicializar los componentes, por si tenemos que enviar información
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { fatalError("No able to create components") }
        // Si tiene parámetros los añadimos como clave valor
        if !parameters.isEmpty { components.queryItems = parameters.map{ key, value in URLQueryItem(name: key, value: value) }  }
        // URL final con los query params
        guard let finalURL = components.url else { fatalError("Unable to get final URL") }
        // Objeto Request
        var request = URLRequest(url: finalURL)
        // Indicamos el método HTTP que vamos a usar en la petición
        request.httpMethod = method.rawValue
        // Si el body no esta vacio lo serializamos y lo añadimos a la petición
        if !body.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }
        // Añadimos el header para enviar objetos JSON serializados
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // Añadimos el header para identificarnos en la petición
        // request.addValue("Noe", forHTTPHeaderField: "Api-Username")
        request.addValue("che1404", forHTTPHeaderField: "Api-Username")
        // Añadimos el API Key para validar la llamada
        request.addValue("699667f923e65fac39b632b0d9b2db0d9ee40f9da15480ad5a4bcb3c1b095b7a", forHTTPHeaderField: "Api-Key")
        
        return request
    }
}
