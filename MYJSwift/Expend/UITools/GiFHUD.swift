//
//  GiFHUD.swift
//  GiFHUD-Swift
//
//  Created by Cem Olcay on 07/11/14.
//  Copyright (c) 2014 Cem Olcay. All rights reserved.
/*用法  加载动画
GiFHUD.showWithOverlay() //显示带底部阴影的gif
GiFHUD.dismiss()  取消gif
*/

import UIKit

class GiFHUD: UIView {
    //hud的背景View
    fileprivate lazy var bgView:UIView = {
        let tmpView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tmpView.backgroundColor = UIColor.clear
        return tmpView
    }()
    //图片
    lazy var imageView:UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageV.image = UIImage(named: "logo80")
        imageV.contentMode = UIViewContentMode.center
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        bgView.addSubview(imageView)
        addSubview(bgView)
        xuanZhuan(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     显示控件
     */
    class func showWithOverlay(_ vc:UIViewController) {
        //        let window: UIWindow = UIApplication.sharedApplication().keyWindow!
        let hud = GiFHUD()
        //        window.addSubview(hud)
        //        window.bringSubviewToFront(hud)
        
        //        hud.center = CGPointMake(vc.view.frame.origin.x, vc.view.frame.origin.y-20)
        if vc.navigationController?.navigationBar.isHidden == true {
            hud.frame = vc.view.frame
            hud.bgView.center = CGPoint(x: hud.center.x, y: hud.center.y)
        }else{
            hud.frame = vc.view.frame
            hud.setTop(0)
            hud.bgView.center = CGPoint(x: hud.center.x, y: hud.center.y-64)
        }
        vc.view.addSubview(hud)
    }
    
    class func dismiss(_ vc:UIViewController) {
        //        let window: UIWindow = UIApplication.sharedApplication().keyWindow!
        //         let hud = GiFHUD()
        for vie in  vc.view.subviews {
            if vie.isKind(of: GiFHUD.self) {
                vie.removeFromSuperview()
                return
            }
        }
    }
    // MARK: - 永久旋转360度
    /*旋转360度*/
    func xuanZhuan(_ view:UIView) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 设定动画选项
        animation.duration = 1; // 持续时间
        animation.repeatCount = MAXFLOAT; // 重复次数
        
        // 设定旋转角度
        
        animation.fromValue = NSNumber(value: 0.0 as Float) // 起始角度
        NSLog("\(Float(2) * Float(M_PI))")
        animation.toValue = NSNumber(value: Float(2) * Float(M_PI) as Float) // 终止角度
        
        // 添加动画
        view.layer.add(animation, forKey: "rotate-layer")
    }
}
