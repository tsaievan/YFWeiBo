//
//  UILabel+Extension.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String?,
                     titleColor: UIColor = .darkGray,
                     fontSize: CGFloat = 13.0,
                     alignment: NSTextAlignment = .left,
                     numberLines: Int = 0) {
        self.init()
        text = title;
        textColor = titleColor
        font = UIFont.systemFont(ofSize: fontSize)
        textAlignment = alignment
        numberOfLines = numberLines
    }
}
