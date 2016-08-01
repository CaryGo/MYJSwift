//
//  JSTabbarController.swift
//  SwiftDemo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 Cary. All rights reserved.
//

import UIKit

let kTabbarSelectClolr = UIColor(red: 118/255.0, green: 226/255.0, blue: 210.0/255.0, alpha: 1.0)
let kTabbarNormalClolr = UIColor(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1.0)

class JSTabbarController: UITabBarController,UITabBarControllerDelegate {
    
    var homeVC = HomeViewController()
    var stewardVC = StewardViewController()
    var callVC = CallViewController()
    var mineVC = MineViewController()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        
        let homeNav = JSBaseNavigationController(rootViewController:homeVC)
        let homeItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "tab_home_normal")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage.init(named: "tab_home_selected")?.imageWithRenderingMode(.AlwaysOriginal))
        homeNav.tabBarItem = homeItem
        
        let stewardNav = JSBaseNavigationController(rootViewController:stewardVC)
        let stewardItem = UITabBarItem.init(title: "孕管家", image: UIImage.init(named: "tab_steward_normal")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage.init(named: "tab_steward_selected")?.imageWithRenderingMode(.AlwaysOriginal))
        stewardNav.tabBarItem = stewardItem
        
        let callNav = JSBaseNavigationController(rootViewController: callVC)
        let callItem = UITabBarItem.init(title: "呼叫器", image: UIImage.init(named: "tab_call_normal")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage.init(named: "tab_call_selected")?.imageWithRenderingMode(.AlwaysOriginal))
        callNav.tabBarItem = callItem;
        
        let mineNav = JSBaseNavigationController(rootViewController: mineVC)
        let mineItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "tab_mine_normal")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage.init(named: "tab_mine_selected")?.imageWithRenderingMode(.AlwaysOriginal))
        mineNav.tabBarItem = mineItem;
        
        self.viewControllers = [homeNav,stewardNav,callNav,mineNav];
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:kTabbarSelectClolr], forState: .Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:kTabbarNormalClolr], forState: .Normal)
        self.delegate = self
    }
    
    func removeSystemTabbarButton() {
        for view in self.tabBar.subviews {
            if view.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                //移除
                view.removeFromSuperview()
            }
        }
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        return true
    }
    
}
