//
//  ErrorModel.swift
//  exHome
//
//  Created by Cyril Romanovsky on 7/17/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

struct ErrorModel: Codable { // any error model
    let status: Int
    let message: String
}
