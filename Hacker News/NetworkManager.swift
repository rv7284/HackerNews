//
//  NetworkManager.swift
//  Jobs
//
//  Created by Ravi Goswami on 21/07/22.
//

import Foundation

class NetworkManager {
    static func request<T: Decodable>(_ route: ApiRoute, model: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: route.urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return print(error)
            }
            
            if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(model, from: data)
                    completion(.success(responseModel))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
