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
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        
        let homeNav = JSBaseNavigationController(rootViewController:homeVC)
        let homeItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "tab_home_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "tab_home_selected")?.withRenderingMode(.alwaysOriginal))
        homeNav.tabBarItem = homeItem
        
        let stewardNav = JSBaseNavigationController(rootViewController:stewardVC)
        let stewardItem = UITabBarItem.init(title: "孕管家", image: UIImage.init(named: "tab_steward_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "tab_steward_selected")?.withRenderingMode(.alwaysOriginal))
        stewardNav.tabBarItem = stewardItem
        
        let callNav = JSBaseNavigationController(rootViewController: callVC)
        let callItem = UITabBarItem.init(title: "呼叫器", image: UIImage.init(named: "tab_call_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "tab_call_selected")?.withRenderingMode(.alwaysOriginal))
        callNav.tabBarItem = callItem;
        
        let mineNav = JSBaseNavigationController(rootViewController: mineVC)
        let mineItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "tab_mine_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "tab_mine_selected")?.withRenderingMode(.alwaysOriginal))
        mineNav.tabBarItem = mineItem;
        
        self.viewControllers = [homeNav,stewardNav,callNav,mineNav];
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:kTabbarSelectClolr], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:kTabbarNormalClolr], for: UIControlState())
        self.delegate = self
    }
    
    func removeSystemTabbarButton() {
        for view in self.tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                //移除
                view.removeFromSuperview()
            }
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}
