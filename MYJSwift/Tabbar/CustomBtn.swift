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
    
    func loadView(_ item: UITabBarItem) {
        
        let imgVX: CGFloat = (self.frame.size.width - 50) / 2
        let imgVY: CGFloat = 3
        let imgVW: CGFloat = 50
        let imgVH: CGFloat = 30
        
        imgV = UIImageView(frame: CGRect(x: imgVX, y: imgVY, width: imgVW, height: imgVH))
        imgV.image = item.image
        
        let labelX: CGFloat = (self.frame.size.width - 50) / 2
        let labelY: CGFloat = 35
        let labelW: CGFloat = 50
        let labelH: CGFloat = 10
        
        let label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
        label.text = item.title
        label.textAlignment = .center
        //        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        
        //判断数据中是否存在title
        if item.title != nil {
            self.addSubview(imgV)
            self.addSubview(label)
        }else {
            imgV.frame = CGRect(x: imgVX, y: imgVY, width: imgVW, height: 42)
            self.addSubview(imgV)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
