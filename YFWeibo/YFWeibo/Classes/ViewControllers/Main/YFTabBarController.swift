//
//  YFTabBarController.swift
//  YFWeibo
//
//  Created by tsaievan on 22/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFTabBarController: UITabBarController {
    
    ///< 发布按钮的懒加载
    lazy var composeButton: UIButton = {
        let button = UIButton(title: nil, image: "tabbar_compose_icon_add", backgroundImage: "tabbar_compose_button", target: self, action: #selector(YFTabBarController.didClickComposeButtonAction(sender:)))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addComposeButton()
    }
}


// MARK: - 设置UI
extension YFTabBarController {
    fileprivate func setupUI () {
        addChildViewControllers()
        setTabBarAttributes()
        view.backgroundColor = .white
    }
    
    private func addChildViewControllers() {
        let homeVc = YFHomeController()
        addChildViewController(viewController: homeVc, title: "首页", imageName: "tabbar_home")
        
        let messageVc = YFMessageController()
        addChildViewController(viewController: messageVc, title: "消息", imageName: "tabbar_message_center")
        
        let emptyVc = UIViewController()
        addChildViewController(viewController: emptyVc, title: "", imageName: "")
        
        let discoverVc = YFDiscoverController()
        addChildViewController(viewController: discoverVc, title: "发现", imageName: "tabbar_discover")
        
        let profileVc = YFProfileController()
        addChildViewController(viewController: profileVc, title: "我", imageName: "tabbar_profile")
    }
    
    private func addChildViewController(viewController: UIViewController, title: String, imageName: String) {
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: "\(imageName)_selected")?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.darkGray], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.orange], for: .selected)
        let nav = UINavigationController(rootViewController: viewController)
        addChildViewController(nav)
    }
    
    private func addComposeButton() {
        composeButton.center = CGPoint(x: SCREEN_WIDTH * 0.5, y: TABBAR_HEIGHT * 0.5)
        tabBar.addSubview(composeButton)
    }
    
    private func setTabBarAttributes() {
        tabBar.backgroundImage = UIImage(named: "tabbar_background")
        tabBar.shadowImage = UIImage.creatImage(size: CGSize(width: 1, height: 1), color: UIColor(white: 0.9, alpha: 1))
    }
}

extension YFTabBarController {
    @objc fileprivate func didClickComposeButtonAction(sender: UIButton) {
        print("点击了发布按钮\(sender)")
    }
}
