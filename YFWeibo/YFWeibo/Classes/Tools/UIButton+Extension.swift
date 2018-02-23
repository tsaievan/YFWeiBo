//
//  UIButton+Extension.swift
//  YFWeibo
//
//  Created by tsaievan on 23/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

extension UIButton {
    ///< 便利构造函数
    convenience init(title: String?,
                     image: String? = nil,
                     backgroundImage: String? = nil,
                     target: Any?,
                     action: Selector?,
                     controlEvents: UIControlEvents? = .touchUpInside) {
        self.init(type: .custom)
        if let title = title {
            setTitle(title, for: .normal)
        }
        if let image = image {
            setImage(UIImage(named: image), for: .normal)
            setImage(UIImage(named: "\(image)_highlighted"), for: .highlighted)
        }
        if let backgroundImage = backgroundImage {
            setBackgroundImage(UIImage(named: backgroundImage), for: .normal)
            setBackgroundImage(UIImage(named: "\(backgroundImage)_highlighted"), for: .highlighted)
        }
        sizeToFit()
        if let target = target,
            let action = action,
            let controlEvents = controlEvents{
            addTarget(target, action: action, for: controlEvents)
        }
    }
}
