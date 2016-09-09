//
//  BaseViewController.swift
//  PathDynamicModal-Demo
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 Ryo Aoyama. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var customNV:CustomNavView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        customNV = CustomNavView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH(), 64))
        customNV.baseVC = self
        self.view.addSubview(customNV)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
