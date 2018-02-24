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
        visitorView.delegate = self
        view.addSubview(visitorView)
    }
}

extension YFViewController: YFVisitorViewDelegate {
    func beginLogin() {
        let oAuthVc = YFOAuthController()
        let nav = UINavigationController(rootViewController: oAuthVc)
        present(nav, animated: true, completion: nil)
    }
}
