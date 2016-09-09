//
//  BaseTabViewController.swift
//  PathDynamicModal-Demo
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 Ryo Aoyama. All rights reserved.
//

import UIKit

class BaseTabViewController: UITabBarController {
    
    func creatViewController()
    {
        let ViewController1 = HomeViewController()
        
        let BaseNav1 = BaseNavController(rootViewController: ViewController1)
        
        BaseNav1.tabBarItem = UITabBarItem(title: "进货", image: UIImage(named: "icon_purchase_normal")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "icon_purchase_pressed")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        let ViewController2 = NewsViewController()
        
        let BaseNav2 = BaseNavController(rootViewController: ViewController2)
        
        BaseNav2.tabBarItem = UITabBarItem(title: "卖典", image: UIImage(named: "icon_information_normal")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "icon_information_pressed")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        let ViewController3 = StoreViewController()
        
        let BaseNav3 = BaseNavController(rootViewController: ViewController3)
        
        BaseNav3.tabBarItem = UITabBarItem(title: "店铺", image: UIImage(named: "icon_shop_normal")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "icon_shop_pressed")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        let controllers = [BaseNav1,BaseNav2,BaseNav3] 
        
        self.viewControllers = controllers
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:RGB_COLOR("#5f656c"),
            NSFontAttributeName:UIFont.systemFontOfSize(10.5)], forState: UIControlState.Normal)
        
         UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:RGB_COLOR("#6841b9"),NSFontAttributeName:UIFont.systemFontOfSize(10.5)], forState: UIControlState.Selected)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tabBar.backgroundColor = RGB_COLOR("#f9f9f9")
        self.creatViewController()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
