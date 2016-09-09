//
//  NewsViewController.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 tianxiuping. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.customNV.navTitle = "卖典"
        self.customNV.leftButton?.hidden = true
        
    }
        
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
