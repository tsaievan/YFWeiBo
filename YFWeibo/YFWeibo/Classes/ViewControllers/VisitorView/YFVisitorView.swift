//
//  YFVisitorView.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFVisitorView: UIView {
    
    /// 大图标
    lazy var iconImageView = UIImageView(imageName: "visitordiscover_feed_image_house")
    
    /// 圆圈视图
    lazy var circleImageView = UIImageView(imageName: "visitordiscover_feed_image_smallicon")
    
    /// 遮罩视图
    lazy var shadowImageView = UIImageView(imageName: "visitordiscover_feed_mask_smallicon")
    
    /// 提示文字
    lazy var textLabel = UILabel(title: "在这里, 你可以追星, 看段子, 交朋友等等", fontSize: 14, alignment: .center)
    
    /// 注册按钮
    lazy var registButton = UIButton(title: "注册", titleColor: GLOBAL_COLOR_ORANGE, fontSize: 14, backgroundImage: "", target: nil, action: nil)
    
    /// 登录按钮
    lazy var loginButton = UIButton(title: "登录", titleColor: GLOBAL_COLOR_DARKGRAY, fontSize: 14, backgroundImage: "", target: nil, action: nil)
    
    override init(frame: CGRect) {
        super.init(frame: SCREEN_BOUNDS)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension YFVisitorView {
    fileprivate func setupUI() {
        addSubview(iconImageView)
        addSubview(circleImageView)
        addSubview(shadowImageView)
        addSubview(textLabel)
        addSubview(registButton)
        addSubview(loginButton)
    }
}
