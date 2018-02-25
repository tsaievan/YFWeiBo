//
//  YFNetworkTool.swift
//  YFWeibo
//
//  Created by tsaievan on 25/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit
import AFNetworking

class YFNetworkTool: AFHTTPSessionManager {
    static let sharedTool = YFNetworkTool()
    func request(method: String, URLString: String, parameters: Any?, success: ((URLSessionDataTask, Any?) -> Void)?,failure: ((URLSessionDataTask?, Error) -> Void)? = nil) {
        if method == "GET" {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        if method == "POST" {
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}
