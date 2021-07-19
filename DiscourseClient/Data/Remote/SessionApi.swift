//
//  SessionApi.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import Foundation

struct ApiError: Codable {
    let action: String
    let errors: [String]?
}

enum SessionApiError: Error {
    case httpError(Int)
    case apiError(ApiError)
}

final class SessionApi {
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    func request<T: APIRequest> (request: T, completion: @escaping(Result<T.Response?, Error>) -> ()) {
        let request = request.requestWithBaseURL()
        
        
        let task = session.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 && httpResponse.statusCode < 500 {
                // En caso de error
                if let dataDecoded = data {
                    do {
                        // ApiError.self -> indicamos el tipo de datos a parsear
                        let model =  try JSONDecoder().decode(ApiError.self, from: dataDecoded)
                        DispatchQueue.main.async {
                            completion(.failure(SessionApiError.apiError(model)))
                        }
                    }
                    catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion(.failure(SessionApiError.httpError(httpResponse.statusCode)))
                    }
                }
                return
            }
            
            // En caso de se complete la petición correctamente
            if let data = data, data.count > 0 {
                do {
                    // Intentamos decodificar los datos y los devolvemos como success o en caso de no poder como failure
                    let model = try JSONDecoder().decode(T.Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model))
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.success(nil))
                }
            }
            
        }
        
        
        
        task.resume()
    }
}


