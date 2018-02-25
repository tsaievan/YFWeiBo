//
//  YFOAuthController.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFOAuthController: UIViewController, UIWebViewDelegate {
    lazy var webView: UIWebView = {
        let wb = UIWebView(frame: SCREEN_BOUNDS)
        wb.delegate = self
        return wb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadWebView()
    }
}

extension YFOAuthController {
    fileprivate func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
    }
}

extension YFOAuthController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}

extension YFOAuthController {
    fileprivate func loadWebView() {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=4029511368&redirect_uri=https://www.baidu.com"
        guard let url = URL(string: urlString) else {
            return
        }
        webView.loadRequest(URLRequest(url: url))
    }
}

// MARK: webView的代理
extension YFOAuthController {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}


