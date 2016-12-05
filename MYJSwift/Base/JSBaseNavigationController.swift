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
        
        let textAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 18),NSForegroundColorAttributeName:UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = kNavDefaultColor
        UINavigationBar.appearance().isTranslucent = true
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
