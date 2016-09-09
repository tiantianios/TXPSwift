//
//  SettingViewController.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/20.
//  Copyright © 2015年 tianxiuping. All rights reserved.
//

import UIKit

typealias sendValueClosure = (string:String)->Void

class SettingViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate{

    var myTableView : UITableView?
    var myClosure:sendValueClosure?
    
    func initWithClosure(closure:sendValueClosure?){
        //将函数指针赋值给myClosure闭包，该闭包中涵盖了someFunctionThatTakesAClosure函数中的局部变量等的引用
        myClosure = closure
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.customNV.navTitle = "设置"
        self.view.backgroundColor = RGB_COLOR("#f5f5f5")
        self.creatUI()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func creatUI()
    {
        myTableView = UITableView(frame: CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.height - 49), style: UITableViewStyle.Grouped)
        myTableView?.backgroundColor = UIColor.clearColor()
        myTableView?.scrollsToTop = true;
        myTableView?.delegate = self
        myTableView?.dataSource = self
        myTableView!.registerClass(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        
        let buttonView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 80))
        buttonView.backgroundColor = UIColor.clearColor()
        
        let exitButton = UIButton(type: .Custom)
        exitButton.frame = CGRectMake(0, 18, self.view.frame.size.width, 46)
        exitButton.backgroundColor = UIColor.whiteColor()
        exitButton .setTitle("退出登录", forState: .Normal)
        exitButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        exitButton .setTitleColor(RGB_COLOR("#e83028"), forState: .Normal)
        exitButton.addTarget(self, action: "exitClick", forControlEvents: .TouchUpInside)
        buttonView.addSubview(exitButton)
        
        myTableView?.tableFooterView = buttonView
        self.view.addSubview(myTableView!)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
      return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 1
        }
        return 3
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 0
        {
            return 15
        }
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.000001
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 46
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SettingTableViewCell

        if indexPath.section == 0
        {
            cell.textLabel?.text = "功能介绍"
        }
        else
        {
            if (indexPath.row == 0)
            {
                cell.textLabel?.text = "意见反馈";
            }
            else if (indexPath.row == 1)
            {
                cell.textLabel?.text = "关于我们";
            }
            else
            {
                cell.textLabel?.text = "喜欢我们,打分鼓励!";
            }
        }
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        cell.textLabel?.textColor = RGB_COLOR("#333333")
        cell.accessoryType = .DisclosureIndicator
        cell.accessoryView?.backgroundColor = RGB_COLOR("#e5e5e5")
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func exitClick()
    {
        switch UIDevice.currentDevice().systemVersion.compare("8.3", options: NSStringCompareOptions.NumericSearch)
        {
        case .OrderedSame, .OrderedDescending:
            
            let action = UIAlertController(title: "确定要退出登录吗?", message: nil, preferredStyle: .ActionSheet)
            action.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (actonC:UIAlertAction) -> Void in
        
            }))
            
            action.addAction(UIAlertAction(title: "确定", style: .Destructive, handler: { (actonD:UIAlertAction) -> Void in
                if (self.myClosure != nil)
                {
                    self.myClosure!(string: "好好哦")
                }
            }))
            self.presentViewController(action, animated: true, completion: nil)
            
            return
        case .OrderedAscending:
            
            let action = UIActionSheet(title: "确定要退出登录吗?", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "确定")
            action.showInView(self.view)
            return
        }
    }
    
    //FIXME:actionSheetdelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int)
    {
        
    }
}
