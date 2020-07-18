//
//  Requets.swift
//  GenericNetworkLayerExample
//
//  Created by Cyril Romanovsky on 7/18/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import Foundation

enum Requests: String {
    case getAllCurrency = "latest"

    var requestData: (url: String, type: HttpMethod ) {
        switch self {
        case .getAllCurrency:
            return (url: AppSetting.shared.baseURLStr + self.rawValue, type: .get )
        }
    }
}
