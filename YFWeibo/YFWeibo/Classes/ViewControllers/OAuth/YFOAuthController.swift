//
//  YFOAuthController.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFOAuthController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension YFOAuthController {
    fileprivate func setupUI() {
        view.backgroundColor = .yellow
    }
}

extension YFOAuthController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
