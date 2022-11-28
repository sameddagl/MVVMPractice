//
//  NetworkService.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

enum NetworkError: String, Error {
    case badURL = "Badly formatted url"
    case sessionError = "Error while making network call"
    case badData = "Error while fetching the data"
    case dataDecoding = "Error while decoding the data"
}


protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping(Result<[Quote], NetworkError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func fetchData(completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let urlString = "https://dummyjson.com/quotes"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(.sessionError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return

            }
            
            do {
                let decodedData = try JSONDecoder().decode(Quotes.self, from: data)
                completion(.success(decodedData.quotes))
            }
            catch {
                completion(.failure(.dataDecoding))
            }
        }.resume()
    }
    
    
}
