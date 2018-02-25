//
//  YFNetworkTool+OAuth.swift
//  YFWeibo
//
//  Created by tsaievan on 25/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

extension YFNetworkTool {
    
    func requestOAuth(code: String, completion: @escaping ((_ dataTask: URLSessionDataTask, _ response: Any) -> ())) {
        let parameters = ["client_id" : APP_KEY,
                          "client_secret" : APP_SECRET,
                          "grant_type" : AUTHORIZATION_CODE,
                          "code" : code,
                          "redirect_uri" : REDIRECT_URI]
        YFNetworkTool.sharedTool.request(method: POST, URLString: ACCESS_TOKEN_URL, parameters: parameters, success: completion)
    }
}
