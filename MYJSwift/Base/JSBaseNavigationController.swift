//
//  JSBaseNavigationController.swift
//  SwiftDemo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 Cary. All rights reserved.
//


import UIKit

let kNavDefaultColor = UIColor.colorWithHexString("ef90ae")

class JSBaseNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSFontAttributeName:UIFont.systemFontOfSize(18),NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().barTintColor = kNavDefaultColor
        UINavigationBar.appearance().translucent = true
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
