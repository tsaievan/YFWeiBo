//
//  NewFeatureView.swift
//  YFWeibo
//
//  Created by tsaievan on 27/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class NewFeatureView: UIView {
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        sv.bounces = false
        return sv
    }()
    
    lazy var pageControl: UIPageControl = {
       let control = UIPageControl()
        control.pageIndicatorTintColor = GLOBAL_COLOR_DARKGRAY
        control.currentPageIndicatorTintColor = GLOBAL_COLOR_ORANGE
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: SCREEN_BOUNDS)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewFeatureView {
    fileprivate func setupUI() {
        addSubview(scrollView)
        addSubview(pageControl)
        makeConstraints()
    }
    
    fileprivate func makeConstraints() {
        
    }
}
