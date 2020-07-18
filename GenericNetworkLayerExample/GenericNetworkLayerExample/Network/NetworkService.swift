//
//  NetworkService.swift
//  exHome
//
//  Created by Cyril Romanovsky on 7/4/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

class NetworkService {

    // Used to switch between live and Mock Data
    var dataLoader: NetworkLoader

    init(dataLoader: NetworkLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    /// Create a request given a URL and requestMethod (get, post, create, etc...)
    func createRequest(
        url: URL?, method: HttpMethod,
        headerVals: [HttpHeaderType: HttpHeaderValue]? = nil,
        params: [String: Any]? = nil
    ) -> URLRequest? {
        guard let requestUrl = url else {
            debugPrint("request URL is nil")
            return nil
        }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = method.rawValue
        if let requestParams = params {
            let jsonData = try? JSONSerialization.data(withJSONObject: requestParams)
            request.httpBody = jsonData
        }
        if let headerType = headerVals {
            headerType.forEach { (val) in
                request.setValue( val.value.rawValue, forHTTPHeaderField: val.key.rawValue)
            }
        }
        return request
    }
}
