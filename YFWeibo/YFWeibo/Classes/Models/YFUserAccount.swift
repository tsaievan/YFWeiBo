//
//  YFUserAccount.swift
//  YFWeibo
//
//  Created by tsaievan on 26/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

let USER_ACCOUNT_KEY = "USER_ACCOUNT_KEY"

@objcMembers
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
    
    override init() {
        super.init()
        readUserAccount()
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    ///< 存储用户信息
    func saveUserAccount(dict: [String : Any]) {
        setValuesForKeys(dict)
        let dict = dictionaryWithValues(forKeys: ["uid",
                                                  "screen_name",
                                                  "avatar_large",
                                                  "access_token",
                                                  "expired_date"])
        UserDefaults.standard.set(dict, forKey: USER_ACCOUNT_KEY)
    }
    
    ///< 读取用户信息
    func readUserAccount() {
        if let userDict = UserDefaults.standard.object(forKey: USER_ACCOUNT_KEY) as? [String : Any] {
            setValuesForKeys(userDict)
        }
    }
}
