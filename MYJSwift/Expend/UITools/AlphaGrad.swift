//
//  AlphaGrad.swift
//  颜色渐变
//
//  Created by zhangnian on 15/11/6.
//  Copyright © 2015年 zhangnian. All rights reserved.
//
/*
//用法  
let bgView = AlphaGrad(frame:UIScreen.mainScreen().bounds)
bgView.colors = [UIColor.greenColor(),UIColor.whiteColor()]
view.addSubview(bgView)
*/
import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


class AlphaGrad: UIView {
    var colors:[UIColor]?
    override func draw(_ rect: CGRect) {
        let gradient1 = CAGradientLayer(layer: layer)
        gradient1.frame = rect
        var tempColors = [CGColor]()
        for i in (colors?.enumerated())!{
            var color = colors?.index(i, offsetBy: 0);
            tempColors.append(colors[i])
        }
        for  var i = 0 ; i < colors?.count ; i += 1 {
            tempColors.append(colors![i].cgColor)
        }
        gradient1.colors = tempColors
        self.layer.insertSublayer(gradient1, at: 0)
    }
}
