//
//  NetworkService.swift
//  exHome
//
//  Created by Cyril Romanovsky on 7/4/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

class NetworkService {
    ///Used to set a`URLRequest`'s HTTP Method
    enum HttpMethod: String {
        case get = "GET"
        case patch = "PATCH"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    /// Used when the endpoint requires a header-type (i.e. "content-type") be specified in the header
    enum HttpHeaderType: String {
        case contentType = "Content-Type"
    }

    /// The value of the header-type (i.e. "application/json")
    enum HttpHeaderValue: String {
        case json = "application/json"
    }

    // Used to switch between live and Mock Data
    var dataLoader: NetworkLoader

    init(dataLoader: NetworkLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }

    
    /// Create a request given a URL and requestMethod (get, post, create, etc...)
    func createRequest(
        url: URL?, method: HttpMethod,
        headerType: HttpHeaderType? = nil,
        headerValue: HttpHeaderValue? = nil
    ) -> URLRequest? {
        guard let requestUrl = url else {
            debugPrint("request URL is nil")
            return nil
        }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = method.rawValue
        if let headerType = headerType,
            let headerValue = headerValue {
            request.setValue(headerValue.rawValue, forHTTPHeaderField: headerType.rawValue)
        }
        return request
    }
}
