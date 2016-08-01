//
//  CustomTabbarController.swift
//  MYJSwift
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 Cary. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var selectedImg: UIImage!
    var selectCount: Int!
    var tabBarImg: UIImage!
    var tabBarView: UIImageView!
    var selectedView: UIImageView!
    var pressBtn: CustomBtn!
    let kScreenW = UIScreen.mainScreen().bounds.size.width
    let kScreenH = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         1.移除原生的btn
         2.创建自定义的btn
         3.选中视图的滑动
         */
        
        tabBarView = UIImageView(frame: CGRectMake(0, 0, kScreenW, 49))
        tabBarView.userInteractionEnabled = true
        self.tabBar.addSubview(tabBarView)
        
    }
    
    /*
     移除原生的btn
     */
    func removeTabBarButton() {
        
        for view in self.tabBar.subviews {
            if view.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                //移除
                view.removeFromSuperview()
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //移除原生的btn
        removeTabBarButton()
    }
    
    override func setViewControllers(viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        //创建自定义的btn
        createCustomBtn()
    }
    
    func createCustomBtn() {
        
        //获取子控制器的个数
        let count: CGFloat = CGFloat(self.viewControllers!.count)
        
        //创建btn的选中视图
        let x: CGFloat = CGFloat(self.selectCount) * kScreenW / count
        let y: CGFloat = 2
        let w: CGFloat = kScreenW / count
        let h: CGFloat = 45
        
        selectedView = UIImageView(frame: CGRectMake(x, y, w, h))
        selectedView.image = self.selectedImg
        tabBarView.addSubview(selectedView)
        
        for i in 0..<Int(count) {
            //获取到tabBarItem对应的子控制器
            let vc = self.viewControllers![i]
            //创建btn，并设置frame，与传入对应子控制器的tabBarItem属性
            let btn = CustomBtn(frame: CGRectMake(CGFloat(i) * kScreenW / count, 0, kScreenW / count, 49), tabBarItem: vc.tabBarItem)
            
            //添加btn的点击方法
            btn.addTarget(self, action: #selector(btnAct), forControlEvents: .TouchUpInside)
            
            if i == self.selectCount {
                btn.imgV.image = btn.item.selectedImage
            }
            
            //设置btn的tag值
            btn.tag = 100 + i
            
            //添加到父视图上
            tabBarView.addSubview(btn)
        }
        
    }
    
    func btnAct(btn: CustomBtn) {
        
        //获取btn的下标
        let index = btn.tag - 100
        //设置第一个btn的高亮取消
        let btnOne = tabBarView.viewWithTag(100) as! CustomBtn
        
        //选中图片和非选中图片的设置
        //第一次点击
        if pressBtn == nil {
            
            //点击的是第一个
            if btn == btnOne {
                btn.imgV.image = btn.item.selectedImage
            }else {
                btnOne.imgV.image = btnOne.item.image
            }
            
        }else {
            
            if pressBtn == btn {
                btn.imgV.image = btn.item.selectedImage
            }else if pressBtn != btn {
                pressBtn.imgV.image = pressBtn.item.image
                btn.imgV.image = btn.item.selectedImage
            }
            
        }
        
        //通过下标实现页面切换
        self.selectedIndex = index
        
        UIView.animateWithDuration(0.3) {
            //设置选中图片的中心点和被点击btn的中心点相同
            self.selectedView.center = btn.center
        }
        
        pressBtn = btn
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}