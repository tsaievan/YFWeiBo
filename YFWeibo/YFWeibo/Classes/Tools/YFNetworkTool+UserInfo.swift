//
//  YFNetworkTool+UserInfo.swift
//  YFWeibo
//
//  Created by tsaievan on 26/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

extension YFNetworkTool {
    func requesetUserInfo(uid: String?, accessToken: String, completion: @escaping ((_ dataTask: URLSessionDataTask, _ response: Any) -> ())) {
        let params = ["uid" : uid,
                      "access_token" : accessToken]
        request(method: GET, URLString: GET_USER_INFO_URL, parameters: params, success: completion)
    }
}
