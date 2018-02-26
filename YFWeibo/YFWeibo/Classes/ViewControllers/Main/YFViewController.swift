//
//  YFViewController.swift
//  YFWeibo
//
//  Created by tsaievan on 22/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFViewController: UIViewController {
    
    var isLogin: Bool {
        return YFUserAccount.sharedAccount.isLogin
    }
    
    var visitorView: YFVisitorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(dismissVisitorView), name: NSNotification.Name(rawValue: LOGIN_SUCCESS_NOTIFICATION), object: nil)
    }
    
    ///< 移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension YFViewController {
    fileprivate func setupUI() {
        setupVisitorView()
    }
    
    fileprivate func setupVisitorView() {
        if visitorView == nil && !isLogin {
            visitorView = YFVisitorView()
            visitorView?.delegate = self
            if let v = visitorView {
                view.addSubview(v)
            }
        }
    }
}

extension YFViewController {
    @objc fileprivate func dismissVisitorView() {
        visitorView?.removeFromSuperview()
        visitorView = nil
    }
}

extension YFViewController: YFVisitorViewDelegate {
    func beginLogin() {
        let oauthVc = YFOAuthController()
        let nav = UINavigationController(rootViewController: oauthVc)
        present(nav, animated: true, completion: nil)
    }
}

