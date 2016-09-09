//
//  BaseNavController.swift
//  PathDynamicModal-Demo
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 Ryo Aoyama. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self .setNavigationBarHidden(false, animated: true)
        self.navigationBar.hidden = true
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(19.0),NSForegroundColorAttributeName:RGB_COLOR("#333333")]
        
        self.navigationBar.backgroundColor = RGBA(245, g: 245, b: 245, a: 0.95)
        self.interactivePopGestureRecognizer?.enabled = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //FIXME:注释
    override func pushViewController(viewController: UIViewController, animated: Bool)
    {
        //TODO: 注释
        if (self.viewControllers.count >= 1)
        {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
