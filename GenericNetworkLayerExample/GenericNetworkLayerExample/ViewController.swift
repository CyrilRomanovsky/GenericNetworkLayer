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
        guard let url = URL(string: "https://api.exchangeratesapi.io/latest") else { return } // next step add url builder
        nl.request(url: url) { (result: Result<(model: SuccussModel?, error: ErrorModel?), Error>) in
            switch result {
            case .success(let succ):
                print(succ)
            case .failure(let error):
                print(error)
            }
        }
    }
}

