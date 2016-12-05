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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.colorWithHexString("c0de76")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "呼叫器"
        
        initUI()
    }
    
    func initUI() {
        let nurseBtn:UIButton = UIButton.init(type: .system)
        nurseBtn.setTitle("医护站", for: UIControlState())
        nurseBtn.setImage(UIImage.init(named: "chat_video_play"), for: UIControlState())
        nurseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nurseBtn.frame = CGRect(x: imageView.width/2.0-20, y: imageView.height/2.0-20, width: 40, height: 40)
        imageView.addSubview(nurseBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func action1(_ sender: AnyObject) {
        let vc:LoginViewController! = LoginViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
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
