//
//  ViewController.swift
//  GenericNetworkLayerExample
//
//  Created by Cyril Romanovsky on 7/17/20.
//  Copyright © 2020 Cyril Romanovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nl = NetworkLayer()
        let requestData = Requests.getAllCurrency.requestData
        
        guard let url = URL(string: requestData.url) else { return }
        nl.request(url: url, type: requestData.type) { (result: Result<(model: SuccussModel?, error: ErrorModel?), Error>) in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error)
            }
        }
    }
}

