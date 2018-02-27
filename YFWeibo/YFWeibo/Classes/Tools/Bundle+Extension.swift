//
//  Bundle+Extension.swift
//  YFWeibo
//
//  Created by tsaievan on 27/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

let CURRENT_VERSION_KEY = "CURRENT_VERSION_KEY"

extension Bundle {
    class var currentVersion: String {
        return main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    class var isNewVersion: Bool {
        guard let oldVersion = UserDefaults.standard.object(forKey: CURRENT_VERSION_KEY) as? String else {
            return true
        }
        if oldVersion == currentVersion {
            saveCurrentVersion()
            return false
        }
        saveCurrentVersion()
        return true
    }
    
    class func saveCurrentVersion() {
        UserDefaults.standard.set(currentVersion, forKey: CURRENT_VERSION_KEY)
    }
}
