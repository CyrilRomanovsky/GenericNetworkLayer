//
//  NetworkLayer.swift
//  exHome
//
//  Created by Cyril Romanovsky on 7/3/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

class NetworkLayer {
    
    private let networkService = NetworkService()
    
    
    func request<T: Codable>(url: URL ,completion: @escaping(Result<(model: T?, error: ErrorModel?), Error>) -> Void) {
        guard let request = networkService.createRequest(url: url, method: .get) else { return }
        let decoder = JSONDecoder()
        networkService.dataLoader.loadData(using: request) { (result) in
            switch result {
            case .success(let dataResponse):
                do {
                    let validateResponseData = try decoder.decode(T.self, from: dataResponse.data)
                    completion(.success((validateResponseData, nil)))
                } catch {
                    do {
                        let errorModel = try decoder.decode(ErrorModel.self, from: dataResponse.data)
                        completion(.success((model: nil, error: errorModel)))
                    } catch {
                        let message = "Error Decoding JSON into \(String(describing: T.Type.self))"
                        completion(.success((model: nil, error: ErrorModel(status: 50, message: message))))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
