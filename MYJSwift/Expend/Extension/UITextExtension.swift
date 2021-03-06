//
//  UITextExtension.swift
//  类扩展
//
//  Created by zhangnian on 16/3/10.
//  Copyright © 2016年 zhangnian. All rights reserved.
//

import UIKit

extension UITextField {
     /**
     左右两边为图片的输入框
     
     - parameter frame:          范围
     - parameter leftImageName:  左边图片
     - parameter rightImageName: 右边图片
     - parameter placheholder:   提示
     - parameter font:           字体大小
     - parameter isPassWord:     是否为密码
     - parameter borderStyle:    边框样式
     - parameter keyboardType:   键盘样式
     
     - returns: 输入框对象
     */
    class func createTextField(_ frame:CGRect, leftImageName:String?, rightImageName:String?, placheholder:String?, font:CGFloat, isPassWord:Bool, borderStyle:UITextBorderStyle?, keyboardType:UIKeyboardType?)->UITextField {
        let textfield = UITextField(frame: frame)
        textfield.configTextField(nil, leftTextColor: nil, rightText: nil, rightTextColor: nil,leftImageName:leftImageName, rightImageName: rightImageName, leftView: nil, rightView: nil, font: font, placheholder: placheholder, isPassWord: isPassWord, borderStyle: borderStyle, keyboardType: keyboardType)

        return textfield
    }
    
     /**
     自定义左右视图的输入框
     
     - parameter frame:        范围
     - parameter leftView:     可选
     - parameter rightView:    可选
     - parameter placheholder: 提示字符
     - parameter font:         字体的大小
     - parameter isPassWord:   是否是密文
     - parameter borderStyle:  输入框样式
     - parameter keyboardType: 键盘样式
     
     - returns: 输入框对象
     */
    class func createTextFieldCustomView(_ frame:CGRect, leftView:UIView?, rightView:UIView?, placheholder:String?, font:CGFloat, isPassWord:Bool, borderStyle:UITextBorderStyle?, keyboardType:UIKeyboardType?)->UITextField {
        let textfield = UITextField(frame: frame)
        textfield.configTextField(nil, leftTextColor: nil, rightText: nil, rightTextColor: nil, leftImageName: nil, rightImageName: nil, leftView: leftView, rightView: rightView, font: font, placheholder: placheholder, isPassWord: isPassWord, borderStyle: borderStyle, keyboardType: keyboardType)
        return textfield
    }
    
    /**
     带下划线的textFiled  此处需要提供图片
     
     - parameter frame: 区域
     - parameter leftImageName: 左图片名
     - parameter rightImageName: 右图片名
     - parameter placheholder: 提示文字
     - parameter font: 字体大小
     - parameter isPassWord: 是否密文
     - parameter keyboardType: 键盘样式
     
     - returns: 对象
     */
    class func createTextFieldunderLine(_ frame:CGRect, leftImageName:String?, rightImageName:String?, placheholder:String, font:CGFloat, isPassWord:Bool, keyboardType:UIKeyboardType?)->UITextField {
        let textfield = UITextField(frame: frame)
        textfield.configTextField(nil, leftTextColor: nil, rightText: nil, rightTextColor: nil,leftImageName:leftImageName, rightImageName: rightImageName, leftView: nil, rightView: nil, font: font, placheholder: placheholder, isPassWord: isPassWord, borderStyle: nil, keyboardType: keyboardType)
        //下划线
        let line = UIView(frame: CGRect(x: 0, y: frame.height-2, width: frame.width, height: 2))
//        line.color = UIColor.lightGray
//        line.contentMode = UIViewContentMode.ScaleToFill
        textfield.addSubview(line)
        
        textfield.textColor = UIColor.white
        return textfield
    }
    
     /**
      左右为文字的输入框
     
     - parameter frame:          范围
     - parameter leftText:       左文字
     - parameter leftTextColor:  颜色
     - parameter rightText:      文字
     - parameter rightTextColor: 颜色
     - parameter placheholder:   提示文字
     - parameter font:           字体大小
     - parameter isPassWord:     是否密文
     - parameter borderStyle:    样式
     - parameter keyboardType:   键盘样式
     
     - returns: 输入框对象
     */
    class func createLabelTextField(_ frame:CGRect, leftText:String?,leftTextColor:UIColor?,rightText:String?,rightTextColor:UIColor?, placheholder:String?, font:CGFloat, isPassWord:Bool, borderStyle:UITextBorderStyle?, keyboardType:UIKeyboardType? )->UITextField {
        let textfield = UITextField(frame: frame)
        textfield.configTextField(leftText, leftTextColor: leftTextColor, rightText: rightText, rightTextColor: rightTextColor,leftImageName:nil, rightImageName: nil, leftView: nil, rightView: nil, font: font, placheholder: placheholder, isPassWord: isPassWord, borderStyle: borderStyle, keyboardType: keyboardType)
        return textfield
    }
    
    /**
     配置输入框信息
     
     - parameter leftText:       左边文字
     - parameter leftTextColor:  左文子颜色
     - parameter rightText:      右文字
     - parameter rightTextColor: 有文字颜色
     - parameter leftImageName:  左图片名称
     - parameter rightImageName: 右图片名称
     - parameter leftView:       左视图
     - parameter rightView:      右视图
     - parameter font:           字体大小
     - parameter placheholder:   提示文字
     - parameter isPassWord:     是否为密码
     - parameter borderStyle:    边框样式
     - parameter keyboardType:   键盘样式
     */
    func configTextField(_ leftText:String?, leftTextColor:UIColor?, rightText:String?,rightTextColor:UIColor?, leftImageName:String?, rightImageName:String?, leftView:UIView?, rightView:UIView?, font:CGFloat,placheholder:String?, isPassWord:Bool, borderStyle:UITextBorderStyle?, keyboardType:UIKeyboardType? ) {
        self.font = UIFont.systemFont(ofSize: font)
        self.textAlignment = NSTextAlignment.left
        self.isSecureTextEntry = isPassWord
        if borderStyle != nil {  //边框
            self.borderStyle = borderStyle!
        }
        if keyboardType != nil { //键盘类型
            self.keyboardType = UIKeyboardType.numbersAndPunctuation
        }
        //关闭首字母大写
        self.autocapitalizationType = UITextAutocapitalizationType.none
        //清除按钮
        self.clearButtonMode = UITextFieldViewMode.whileEditing
        if placheholder != nil {
            self.placeholder = placheholder
        }
        if leftText != nil { //左边文字
            let leftLabel = UILabel.createLabel(CGRect(x: 0, y: 0, width: font*CGFloat(leftText!.length), height: frame.size.height), text: leftText!, textColor: leftTextColor!, font: font-2)
            self.leftView = leftLabel
            self.leftViewMode = UITextFieldViewMode.always
        }else if leftView != nil { //左视图
            self.leftView = leftView
            self.leftViewMode = UITextFieldViewMode.always
        }else if leftImageName != nil {//左图片
            let leftImageView = UIImageView.createImageView(CGRect(x: 0, y: 0, width: 50, height: frame.size.height), imageName: leftImageName!)
            self.leftView = leftImageView
            self.leftViewMode = UITextFieldViewMode.always
        }
        
        if rightText != nil { //有边文字
            let rightLabel = UILabel.createLabel(CGRect(x: 0, y: 0, width: font*CGFloat(rightText!.length), height: frame.size.height), text: rightText!, textColor: rightTextColor!, font: font-2)
            self.rightView = rightLabel
            self.rightViewMode = UITextFieldViewMode.always
        }else if rightView != nil {//右边视图
            self.rightView = rightView
            self.rightViewMode = UITextFieldViewMode.always
        }else if rightImageName != nil {//右图片
            let rightImageView = UIImageView.createImageView(CGRect(x: 0, y: 0, width: 50, height: frame.size.height), imageName: rightImageName!)
            self.rightView = rightImageView
            self.rightViewMode = UITextFieldViewMode.always
        }


        self.textColor = UIColor.black
    }
    
    
}
