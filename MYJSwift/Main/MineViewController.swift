//
//  MineViewController.swift
//  MYJSwift
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 Cary. All rights reserved.
//

import UIKit

class MineViewController: JSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我的"
        let label:UILabel = UILabel.init()
        label.frame = CGRectMake(100, 100, 100, 100)
        label.text = "天上的星星不说话"
        label.textColor = UIColor.redColor()

        self.view.addSubview(label)
        // Do any additional setup after loading the view.
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
