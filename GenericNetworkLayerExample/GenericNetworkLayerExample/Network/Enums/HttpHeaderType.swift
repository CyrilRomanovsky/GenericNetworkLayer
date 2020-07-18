//
//  HttpHeaderType.swift
//  GenericNetworkLayerExample
//
//  Created by Cyril Romanovsky on 7/18/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

/// Used when the endpoint requires a header-type (i.e. "content-type") be specified in the header
enum HttpHeaderType: String {
    case contentType = "Content-Type"
}
