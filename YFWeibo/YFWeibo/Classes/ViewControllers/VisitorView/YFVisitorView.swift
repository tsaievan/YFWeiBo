//
//  YFVisitorView.swift
//  YFWeibo
//
//  Created by tsaievan on 24/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit
import SnapKit

protocol YFVisitorViewDelegate: NSObjectProtocol {
    func beginLogin()
}

class YFVisitorView: UIView {
    
    weak var delegate: YFVisitorViewDelegate?
    
    /// 大图标
    lazy var iconImageView = UIImageView(imageName: "visitordiscover_feed_image_house")
    
    /// 圆圈视图
    lazy var circleImageView = UIImageView(imageName: "visitordiscover_feed_image_smallicon")
    
    /// 遮罩视图
    lazy var shadowImageView = UIImageView(imageName: "visitordiscover_feed_mask_smallicon")
    
    /// 提示文字
    lazy var textLabel = UILabel(title: "在这里, 你可以追星, 看段子, 交朋友等等", fontSize: 14, alignment: .center)
    
    /// 注册按钮
    lazy var registButton = UIButton(title: "注册", titleColor: GLOBAL_COLOR_ORANGE, fontSize: 14, backgroundImage: "common_button_white_disable", target: self, action: #selector(YFVisitorView.register))
    
    /// 登录按钮
    lazy var loginButton = UIButton(title: "登录", titleColor: GLOBAL_COLOR_DARKGRAY, fontSize: 14, backgroundImage: "common_button_white_disable", target: self, action: #selector(YFVisitorView.login))
    
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
        backgroundColor = VISITOR_VIEW_BACKGROUND_COLOR
        addSubview(iconImageView)
        addSubview(circleImageView)
        addSubview(shadowImageView)
        addSubview(textLabel)
        addSubview(registButton)
        addSubview(loginButton)
        
        makeConstraints()
        addAnimations()
    }
    
    fileprivate func makeConstraints() {
        ///< 自动布局
        iconImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-100)
        }
        
        circleImageView.snp.makeConstraints { (make) in
            make.center.equalTo(iconImageView)
        }
        
        shadowImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(circleImageView)
            make.centerY.equalTo(circleImageView).offset(50)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(shadowImageView)
            make.centerY.equalTo(circleImageView).offset(150)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
        registButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(70)
            make.bottom.equalTo(self).offset(-150)
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-70)
            make.bottom.equalTo(registButton)
            make.size.equalTo(registButton)
        }
    }
    
    fileprivate func addAnimations() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Double.pi * 2
        animation.duration = 10
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        circleImageView.layer.add(animation, forKey: nil)
    }
}

extension YFVisitorView {
    @objc fileprivate func register() {
        print("点击了注册按钮")   
    }
    
    @objc fileprivate func login() {
        print("点击了登录按钮")
        delegate?.beginLogin()
    }
}
