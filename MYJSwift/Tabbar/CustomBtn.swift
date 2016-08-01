//
//  CustomBtn.swift
//  MYJSwift
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 Cary. All rights reserved.
//

import UIKit

class CustomBtn: UIControl {
    
    var imgV: UIImageView!
    var item: UITabBarItem!
    
    //btn的初始化方法
    init(frame: CGRect, tabBarItem item: UITabBarItem) {
        
        super.init(frame: frame)
        self.item = item
        loadView(item)
    }
    
    func loadView(item: UITabBarItem) {
        
        let imgVX: CGFloat = (self.frame.size.width - 50) / 2
        let imgVY: CGFloat = 3
        let imgVW: CGFloat = 50
        let imgVH: CGFloat = 30
        
        imgV = UIImageView(frame: CGRectMake(imgVX, imgVY, imgVW, imgVH))
        imgV.image = item.image
        
        let labelX: CGFloat = (self.frame.size.width - 50) / 2
        let labelY: CGFloat = 35
        let labelW: CGFloat = 50
        let labelH: CGFloat = 10
        
        let label = UILabel(frame: CGRectMake(labelX, labelY, labelW, labelH))
        label.text = item.title
        label.textAlignment = .Center
        //        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.whiteColor()
        
        //判断数据中是否存在title
        if item.title != nil {
            self.addSubview(imgV)
            self.addSubview(label)
        }else {
            imgV.frame = CGRectMake(imgVX, imgVY, imgVW, 42)
            self.addSubview(imgV)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}