//
//  HttpMethod.swift
//  GenericNetworkLayerExample
//
//  Created by Cyril Romanovsky on 7/18/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

///Used to set a`URLRequest`'s HTTP Method
enum HttpMethod: String {
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
