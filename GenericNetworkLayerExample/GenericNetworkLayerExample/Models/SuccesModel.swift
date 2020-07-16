//
//  SuccesModel.swift
//  exHome
//
//  Created by Cyril Romanovsky on 7/17/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

struct SuccussModel: Codable {
    let rates: [String: Double]
    let base, date: String
}
