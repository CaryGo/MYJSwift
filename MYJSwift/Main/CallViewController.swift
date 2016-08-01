//
//  CallViewController.swift
//  MYJSwift
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 Cary. All rights reserved.
//

import UIKit

class CallViewController: JSBaseViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.colorWithHexString("c0de76")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "呼叫器"
        
        initUI()
    }
    
    func initUI() {
        let nurseBtn:UIButton = UIButton.init(type: .System)
        nurseBtn.setTitle("医护站", forState: .Normal)
        nurseBtn.setImage(UIImage.init(named: "chat_video_play"), forState: .Normal)
        nurseBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        nurseBtn.frame = CGRectMake(imageView.width/2.0-20, imageView.height/2.0-20, 40, 40)
        imageView.addSubview(nurseBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func action1(sender: AnyObject) {
        let vc:LoginViewController! = LoginViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        self.presentViewController(vc, animated: true, completion: nil)
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
