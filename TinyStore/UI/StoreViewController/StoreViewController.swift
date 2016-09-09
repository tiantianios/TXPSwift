//
//  StoreViewController.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 tianxiuping. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,StoreCollectionReusableViewDelegate{

    var storeCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let leftButton = UIButton(type: UIButtonType.Custom)
        leftButton.frame = CGRectMake(0, 0, 35, 44)
        leftButton .setTitle("设置", forState: UIControlState.Normal)
        leftButton.setTitleColor(RGB_COLOR("#333333"), forState: UIControlState.Normal)
        leftButton.addTarget(self, action: "leftButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        leftButton.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        leftButton.backgroundColor = UIColor.clearColor()
       
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.customNV.navTitle = "店铺管理"
        
        let setButton = self.customNV .createNavButttonByTitle("设置", target: self, action: "leftButtonClick:")
        setButton.setTitleColor(RGB_COLOR("#333333"), forState: .Normal)
        setButton.titleLabel?.font = UIFont.systemFontOfSize(16.5)
        self.customNV.setLeftNavButton(setButton)
        
        self.creatUI()
    }

    func leftButtonClick(button:UIButton)
    {
        let settingVC = SettingViewController()
        settingVC.initWithClosure(someFunctionThatTakesAClosure)
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    //闭包传值
    func someFunctionThatTakesAClosure(string:String) -> Void {
        // function body goes here
       self.customNV.navTitle = string
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func creatUI()
    {
        self.creatCollectionView()
    }
    
    func creatCollectionView()
    {
        let collectionViewLayout = UICollectionViewFlowLayout()
        //设置行之间的最小距离  系统默认是10
        collectionViewLayout.minimumLineSpacing = 1.0
        //设置列之间的最小距离
        collectionViewLayout.minimumInteritemSpacing = 1.0
        storeCollectionView = UICollectionView(frame: CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 49), collectionViewLayout: collectionViewLayout)
        storeCollectionView.backgroundColor = RGB_COLOR("#f5f5f5")
        storeCollectionView.delegate = self
        storeCollectionView.dataSource = self
        storeCollectionView.alwaysBounceVertical = true
        
        storeCollectionView.registerClass(StoreCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionSectionHeader")
        
        storeCollectionView.registerClass(StoreCollectionViewCell.self, forCellWithReuseIdentifier: "storeCell")
        
        self.view.addSubview(storeCollectionView)
    }
    
    //FIXME:UICollectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 2
    }
    
    //设置区内有多少个item
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 0
        }
        return 6
    }
    
    //设置每个item的大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(SCREEN_WIDTH()/2-0.5, 109)
    }
    
    //设置距离屏幕上左下右的距离
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return  UIEdgeInsetsMake(0,0,10,0)
    }
    
    //设置页眉宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if section == 0
        {
            return CGSizeMake(SCREEN_WIDTH(), 195)
        }
        return CGSizeZero
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSizeZero
    }
    
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
//        {
//            return 0
//        }
//    
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
//        {
//            return 1.0
//        }
    
    //设置页眉
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        if kind == UICollectionElementKindSectionHeader
        {
            let sectionHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionSectionHeader", forIndexPath: indexPath) as! StoreCollectionReusableView
            sectionHeaderView.delegate = self
            
            return sectionHeaderView
        }
        return UICollectionReusableView()
    }
    
    //根据不同的区 建立不同的item
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("storeCell", forIndexPath: indexPath) as! StoreCollectionViewCell
        cell.backgroundColor = UIColor.whiteColor()
        let imageArr = ["icon_goodsManage","icon_storeAdd","icon_storeIncome","icon_orderManage","icon_weiZone","icon_storeData"]
        let nameArr = ["商品管理","添加自营商品","我的收入","订单管理","微公社","店铺数据"]
        if indexPath.section == 1
        {
            cell .getData(imageArr[indexPath.row], nameTitle: nameArr[indexPath.row])
        }
//            let bgView = UIView()
//            bgView.backgroundColor = UIColor.grayColor()
//            cell.selectedBackgroundView = bgView
            return cell
    }
    
//    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool
//    {
//        return true
//    }
//    
//    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath)
//    {
//        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.redColor()
//    }
    
//    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath)
//    {
//        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.redColor()
//    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let settingVC = SettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    //FIXME:StoreCollectionReusableViewDelegate
    func gotoEditStore()
    {
        
    }
    
    func gotoShareStore()
    {
    
    }
    
    func gotoCheckStore()
    {
        
    }
    
}
