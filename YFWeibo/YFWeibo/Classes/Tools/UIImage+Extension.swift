//
//  UIImage+Extension.swift
//  YFWeibo
//
//  Created by tsaievan on 23/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

extension UIImage {
    class func creatImage(size: CGSize, color: UIColor) -> UIImage? {
        ///< 1. 开启图形上下文
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        ///< 2. 设置填充颜色
        color.setFill()
        ///< 3. 设置填充范围
        ///< note: 这里需要注意的是, 设置填充颜色一定要放在设置填充范围的前面
        UIRectFill(CGRect(origin: .zero, size: size))
        ///< 4. 获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        ///< 5. 关闭图形上下文
        UIGraphicsEndImageContext()
        ///< 6. 返回图片
        return image
    }
}
