//
//  YFTabBarController.swift
//  YFWeibo
//
//  Created by tsaievan on 22/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - 设置UI
extension YFTabBarController {
    fileprivate func setupUI () {
        addChildViewControllers()
        view.backgroundColor = .white
    }
    
    private func addChildViewControllers() {
        let homeVc = YFHomeController()
        addChildViewController(viewController: homeVc, title: "首页", imageName: "tabbar_home")
        
        let messageVc = YFMessageController()
        addChildViewController(viewController: messageVc, title: "消息", imageName: "tabbar_message_center")
        
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
}
