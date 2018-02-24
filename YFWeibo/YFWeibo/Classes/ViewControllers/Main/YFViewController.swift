//
//  YFViewController.swift
//  YFWeibo
//
//  Created by tsaievan on 22/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension YFViewController {
    fileprivate func setupUI() {
        setupVisitorView()
    }
    
    fileprivate func setupVisitorView() {
        let visitorView = YFVisitorView()
        view.addSubview(visitorView)
    }
}
