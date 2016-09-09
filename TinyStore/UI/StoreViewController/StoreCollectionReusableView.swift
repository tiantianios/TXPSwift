//
//  StoreCollectionReusableView.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/21.
//  Copyright © 2015年 tianxiuping. All rights reserved.
//

import UIKit

protocol StoreCollectionReusableViewDelegate
{
    func gotoEditStore()
    func gotoShareStore()
    func gotoCheckStore()
}

class StoreCollectionReusableView: UICollectionReusableView
{
    var delegate : StoreCollectionReusableViewDelegate?
    var headImageView:UIImageView!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.creatUI()
    }

    func creatUI()
    {
        let topImageView = UIImageView(frame: CGRectMake(0, 0, SCREEN_WIDTH(), 24))
        let image = UIImage(named: "bg_shop_eaves")
        let color = UIColor(patternImage: image!)
        topImageView.backgroundColor = color
        self.addSubview(topImageView)
        
        headImageView = UIImageView(frame: CGRectMake((SCREEN_WIDTH() - 75)/2 + 2.5 , 45, 70, 70))
        headImageView.layer.masksToBounds = true
        headImageView.layer.cornerRadius = 35
        headImageView.image = UIImage(named: "icon_default_avatar")
        self.addSubview(headImageView)
        
        let headBackGroundView = UIButton(type: UIButtonType.Custom)
        headBackGroundView.frame = CGRectMake((SCREEN_WIDTH() - 75)/2 , 43, 75, 75)
        headBackGroundView .setBackgroundImage(UIImage(named: "headpic"), forState: UIControlState.Normal)
        headBackGroundView.addTarget(self, action: "editStore:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(headBackGroundView)
        
       let coverImageView = UIImageView(frame: CGRectMake(headBackGroundView.frame.origin.x, headBackGroundView.frame.origin.y+headBackGroundView.frame.size.height - 20, 75, 21))
        coverImageView.image = UIImage(named: "icon_editheadpic")
        self.addSubview(coverImageView)
        
        let nameLabel = UILabel(frame: CGRectMake(0, 43 + headImageView.frame.size.height + 9, SCREEN_WIDTH(), 30))
        nameLabel.font = UIFont.systemFontOfSize(16)
        nameLabel.textColor = RGB_COLOR("#333333")
        nameLabel.text = "还没想好名字"
        nameLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(nameLabel)
        
        let shareStoreBtn = UIButton(type: UIButtonType.Custom)
        shareStoreBtn.frame = CGRectMake(32,165, 100, 25)
        shareStoreBtn .setImage(UIImage(named: "icon_shareStore"), forState: UIControlState.Normal)
        shareStoreBtn .setTitle("分享店铺", forState: .Normal)
        shareStoreBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        shareStoreBtn.setTitleColor(RGB_COLOR("#333333"), forState: .Normal)
        shareStoreBtn.titleLabel?.textAlignment = NSTextAlignment.Right
        shareStoreBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 10)
        shareStoreBtn.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 2)
        shareStoreBtn.addTarget(self, action: "shareStore:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(shareStoreBtn)
        
        let checkStoreBtn = UIButton(type: UIButtonType.Custom)
        checkStoreBtn.frame = CGRectMake(SCREEN_WIDTH()/2 + 32,165, 100, 25)
        checkStoreBtn .setImage(UIImage(named: "icon_seeStore"), forState: UIControlState.Normal)
        checkStoreBtn .setTitle("查看店铺", forState: .Normal)
        checkStoreBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        checkStoreBtn.setTitleColor(RGB_COLOR("#333333"), forState: .Normal)
        checkStoreBtn.titleLabel?.textAlignment = NSTextAlignment.Right
        checkStoreBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 10)
        checkStoreBtn.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 2)
        checkStoreBtn.addTarget(self, action: "checkStore:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(checkStoreBtn)
    }
    
    func editStore(button:UIButton)
    {
        self.delegate?.gotoEditStore()
    }
    
    func shareStore(Button:UIButton)
    {
        self.delegate?.gotoShareStore()
    }
    
    func checkStore(Button:UIButton)
    {
        self.delegate?.gotoCheckStore()
    }
}
