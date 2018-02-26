//
//  YFUserAccount.swift
//  YFWeibo
//
//  Created by tsaievan on 26/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFUserAccount: NSObject {
    
    /// 单例
    static let sharedAccount: YFUserAccount = YFUserAccount()
    
    /// userId
    var uid: String?
    
    /// 用户昵称
    var screen_name: String?
    
    /// 用户头像
    var avatar_large: String?
    
    /// access_token
    var access_token: String?
    
    /// 过期的秒数
    var expires_in: TimeInterval = 0 {
        didSet {
            expired_date = Date(timeInterval: expires_in, since: Date())
        }
    }
    
    var expired_date: Date?
    
    var isExpired: Bool {
        return expired_date?.compare(Date()) == .orderedAscending
    }
    
    var isLogin: Bool {
        return (access_token != nil) && !isExpired
    }
}
