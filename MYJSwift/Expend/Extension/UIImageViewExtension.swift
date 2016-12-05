//
//  UIImageViewExtension.swift
//  类扩展
//
//  Created by zhangnian on 15/11/19.
//  Copyright © 2015年 zhangnian. All rights reserved.
//

import UIKit

// MARK: - UIImageView
extension UIImageView {
    /**
     开启了人机交互的图片
     
     - parameter frame: 区域
     - parameter imageName: 图片名
     - returns: 对象
     */
    class func createImageView(_ frame:CGRect, imageName:String?)->UIImageView {
        let imageView:UIImageView = UIImageView(frame: frame)
        if imageName != nil {
            imageView.image = UIImage(named: imageName!)
            imageView.contentMode = UIViewContentMode.center
        }
        imageView.isUserInteractionEnabled = true
        return imageView
    }
    /**
     对sdwebimage 进一步封装
     
     - parameter url:                  图片请求网址
     - parameter placeholderImageName: 本地图片名称
     */
    /*结合SDWebimage 使用
    func zn_setImageWithURL(urlStr: String, placeholderImageName: String) {
        self.sd_setImageWithURL(NSURL(string: urlStr), placeholderImage: UIImage(named: placeholderImageName))
    }
    */
}


extension UIImage{
    //裁剪指定区域的图片
    func croppedImage(_ bound : CGRect) -> UIImage
    {
        let scaledBounds : CGRect = CGRect(x: bound.origin.x * self.scale, y: bound.origin.y * self.scale, width: bound.size.width * self.scale, height: bound.size.height * self.scale)
        let imageRef = self.cgImage?.cropping(to: scaledBounds)
        let croppedImage : UIImage = UIImage(cgImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.up)
        return croppedImage;
    }
    
    /// 按尺寸裁剪图片大小
    class func imageClipToNewImage(_ image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    /// 将传入的图片裁剪成带边缘的原型图片
    class func imageWithClipImage(_ image: UIImage, borderWidth: CGFloat, borderColor: UIColor) -> UIImage {
        let imageWH = image.size.width
        //        let border = borderWidth
        let ovalWH = imageWH + 2 * borderWidth
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: ovalWH, height: ovalWH), false, 0)
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: ovalWH, height: ovalWH))
        borderColor.set()
        path.fill()
        
        let clipPath = UIBezierPath(ovalIn: CGRect(x: borderWidth, y: borderWidth, width: imageWH, height: imageWH))
        clipPath.addClip()
        image.draw(at: CGPoint(x: borderWidth, y: borderWidth))
        
        let clipImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return clipImage!
    }
    
    /// 将传入的图片裁剪成圆形图片
    func imageClipOvalImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        ctx?.addEllipse(in: rect)
        
        ctx?.clip()
        self.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /**
     图片压缩 压缩系数小于0.3的话 模糊的有点明显 为0.3时 图片大小降低至原来的十分之一
     
     - parameter image: 要模糊的图片
     - parameter scaleFloat: 模糊系数
     
     - returns: 压缩后的图片
     */
    class func scaleImage(_ image:UIImage,scaleFloat:CGFloat) -> UIImage
    {
        let size = CGSize(width: image.size.width * scaleFloat, height: image.size.height * scaleFloat);
        
        UIGraphicsBeginImageContext(size);
        let context = UIGraphicsGetCurrentContext()
        var transform = CGAffineTransform.identity
        
        transform = transform.scaledBy(x: scaleFloat, y: scaleFloat);
        context?.concatenate(transform);
        
        // Draw the image into the transformed context and return the image
        image.draw(at: CGPoint(x: 0.0, y: 0.0))
        let newimg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newimg!;
    }
}
