//
//  JSBaseViewController.swift
//  SwiftDemo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 Cary. All rights reserved.
//

import UIKit

class JSBaseViewController: UIViewController {
    func showAddressBook() {
        print("showAddressBook")
    }
    func addAction()  {
        print("addAction")
    }
    func searchAction()  {
        print("searchAction")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kWhiteColor
        
        
    }
}
