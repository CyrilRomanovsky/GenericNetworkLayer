//
//  URLSession.swift
//  exHome
//
//  Created by Cyril Romanovsky on 7/4/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

protocol NetworkLoader {
    func loadData(using request: URLRequest, with completion: @escaping (Result<(data: Data, response: HTTPURLResponse), Error>) -> Void)
}

extension URLSession : NetworkLoader {
    func loadData(using request: URLRequest, with completion: @escaping (Result<(data: Data, response: HTTPURLResponse), Error>) -> Void) {
        self.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let response = response as? HTTPURLResponse, let data = data {
                completion(.success((data, response)))
            }
        }.resume()
    }
}
