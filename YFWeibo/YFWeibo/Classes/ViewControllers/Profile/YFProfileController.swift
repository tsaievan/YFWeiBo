//
//  YFProfileController.swift
//  YFWeibo
//
//  Created by tsaievan on 22/2/18.
//  Copyright © 2018年 tsaievan. All rights reserved.
//

import UIKit

class YFProfileController: YFViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setVisitorView(imageName: "visitordiscover_image_profile", title: "我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的", animation: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
