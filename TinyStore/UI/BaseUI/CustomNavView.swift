//
//  CustomNavView.swift
//  TinyStore
//
//  Created by tianxiuping on 15/9/22.
//  Copyright © 2015年 tianxiuping. All rights reserved.
//

import UIKit

class CustomNavView: UIView
{
    var bgImageView: UIImageView!
    var bottomView:UIView!
    var titleLabel:UILabel!
    var backButton:UIButton!
    var baseVC:UIViewController?
    var leftButton:UIButton?
    var rightButton:UIButton?
    var navTitle:String?
    {
        set
        {
            titleLabel.text = newValue
        }
        get
        {
            return titleLabel.text
        }

    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }

    override  init(frame: CGRect)
    {
        super.init(frame: frame)
        self.UIConfig()
    }
   
    func UIConfig()
    {
        self.backgroundColor = UIColor.whiteColor()
        self.setBgView()
        self.makeNavTitleLable()
        self.setBackButton()
    }
    
    func setBgView()
    {
        bgImageView = UIImageView(frame: self.bounds)
        bgImageView.backgroundColor = UIColor(red: 254/255.0, green: 254/255.0, blue: 254/255.0, alpha: 0.95)
        self.addSubview(bgImageView)
        
        bottomView = UIView(frame: CGRectMake(0, bgImageView.frame.size.height - 0.5, SCREEN_WIDTH(), 0.5))
        bottomView.backgroundColor = RGB_COLOR("#d2d2d2")
        bottomView.alpha = 0.6
        bgImageView.addSubview(bottomView)
    }
    
    func makeNavTitleLable()
    {
        titleLabel = UILabel(frame: CGRectZero)
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = RGB_COLOR("#333333")
        titleLabel.font = UIFont.systemFontOfSize(19)
        titleLabel.textAlignment = .Center
        titleLabel.frame = CGRectMake(barBtnSize().width + 5.0, 22.0, SCREEN_WIDTH() - 2*barBtnSize().width - 10.0, 40.0)
        self.addSubview(titleLabel)
    }
    
    func setBackButton()
    {
        backButton = self.createNavButtonByImageNormal("icon_back", strSelected: "icon_back", target: self, action: "backButtonClicked:")
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0)
        self.setLeftNavButton(backButton)
    }
    
    func backButtonClicked(button:UIButton)
    {
        if (self.baseVC?.presentedViewController
         != nil)
        {
            self.baseVC?.dismissViewControllerAnimated(true, completion: { () -> Void in
            
         })
        }
        else
        {
            self.baseVC?.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func setLeftNavButton(button:UIButton)
    {
        if (leftButton != nil)
        {
            leftButton?.removeFromSuperview()
            leftButton = nil
        }
        leftButton = button
        if (leftButton != nil)
        {
            leftButton?.frame = CGRectMake(2.0, 22.0, barBtnSize().width, barBtnSize().height)
            self.addSubview(leftButton!)
        }
    }
    
    func setRightNavButton(button:UIButton)
    {
        if (rightButton != nil)
        {
            rightButton?.removeFromSuperview()
            rightButton = nil
        }
        rightButton = button
        if (rightButton != nil)
        {
            rightButton?.frame = CGRectMake(SCREEN_WIDTH() - barBtnSize().width - 5, 22.0, barBtnSize().width, barBtnSize().height)
            self.addSubview(rightButton!)
        }
    }
    
    func createNavButtonByImageNormal(strNormal:NSString,strSelected:NSString,target:AnyObject,action:Selector) ->UIButton
    {
        let imageNormal = UIImage(named: strNormal as String)
        let button = UIButton(type: .Custom)
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        button.setImage(imageNormal, forState: .Normal)
        
        if strSelected.length > 0
        {
            button.setImage(UIImage(named: strSelected as String), forState: .Selected)
        }
        else
        {
            button.setImage(imageNormal, forState: .Selected)
        }
        
        var leftInset = (barBtnSize().width - (imageNormal?.size.width)!)/2.0
        var topInset = (barBtnSize().width - (imageNormal?.size.height)!)/2.0
        
        leftInset = (leftInset >= 2.0) ? leftInset / 2.0 : 0.0;
        topInset = (topInset >= 2.0) ? topInset / 2.0 : 0.0;
        button.imageEdgeInsets = UIEdgeInsetsMake(topInset, leftInset, topInset, leftInset)
        button.titleEdgeInsets = UIEdgeInsetsMake(topInset, -imageNormal!.size.width, topInset, leftInset)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, +30, 0, 0)
        
        return button
    }
    
    func createNavButttonByTitle(strTitle:NSString,target:AnyObject,action:Selector) ->UIButton
    {
        let button = UIButton(type: .Custom)
        button .setTitle(strTitle as String, forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15.0)
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return button
    }
}
