//
//  Network.swift
//  Pharus
//
//  Created by Victor Colen on 27/03/22.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Codable>(httpMethod: String?,
                             httpBody: Data?,
                             dataType: T.Type,
                             baseUrlString: String,
                             parameters: [String: Any]?,
                             completion: @escaping ((Result<T, Error>) -> Void))
}

class Network: APIClientProtocol {
    func request<T>(httpMethod: String? = "GET",
                    httpBody: Data? = nil,
                    dataType: T.Type,
                    baseUrlString: String,
                    parameters: [String: Any]? = nil,
                    completion: @escaping ((Result<T, Error>) -> Void)) where T : Codable {
        
        var newUrlString = baseUrlString
        
        if let parameters = parameters {
            newUrlString += "?"
            for parameter in parameters {
                newUrlString += "\(parameter.key)=\(parameter.value)&"
            }
            //remove extra "&" at the end
            newUrlString.removeLast()
        }
        
        let url = URL(string: newUrlString)
        guard url != nil else {
            return
        }
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = httpMethod
        
        if let httpBody = httpBody {
            urlRequest.httpBody = httpBody
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        let safeData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(safeData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
}
