//
//  YFOAuthController.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

let APP_KEY = "4029511368"
let APP_SECRET = "85c1527aa49bf3fb261875f48bcfcc2e"
let REDIRECT_URI = "https://www.baidu.com"
let GET = "GET"
let POST = "POST"
let ACCESS_TOKEN_URL = "https://api.weibo.com/oauth2/access_token"
let AUTHORIZATION_CODE = "authorization_code"


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
        if let urlString = request.url?.absoluteString, urlString.hasPrefix(REDIRECT_URI) {
            if let query = request.url?.query, query.hasPrefix("code=") {
                let code = String(query["code=".endIndex...])
                let parameters = ["client_id" : APP_KEY,
                                  "client_secret" : APP_SECRET,
                                  "grant_type" : AUTHORIZATION_CODE,
                                  "code" : code,
                                  "redirect_uri" : REDIRECT_URI]
                
                YFNetworkTool.sharedTool.request(method: POST, URLString: ACCESS_TOKEN_URL, parameters: parameters, success: { (_, response) in
                    print("response==========\(response)")
                })
            }else {
                dismiss(animated: true, completion: nil)
            }
            return false
        }
        return true
    }
    
    
    /// 网页加载完成之后, 调用该方法, 调用js必须在此位置
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webView.stringByEvaluatingJavaScript(from: "document.getElementById('userId').value='caiyifancool333@sina.com';document.getElementById('passwd').value='1292086774'")
    }
}


