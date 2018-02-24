//
//  UIImageView+Extension.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(imageName: String?) {
        self.init()
        image = UIImage(named: imageName ?? "")
    }
}
