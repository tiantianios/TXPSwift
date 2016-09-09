//
//  HomeViewController.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 tianxiuping. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var homeCollectionView: UICollectionView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "进货";
        self.navigationController?.navigationBar.hidden = true
        self.customNV.hidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        self.creatUI()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    func creatUI()
    {
        self.creatCollectionView()
    }
    
    func creatCollectionView()
    {
        let collectionViewLayout = UICollectionViewFlowLayout()
        //设置行之间的最小距离  系统默认是10
        collectionViewLayout.minimumLineSpacing = 20.0
        //设置列之间的最小距离
        collectionViewLayout.minimumInteritemSpacing = 11
        homeCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49), collectionViewLayout: collectionViewLayout)
        homeCollectionView.backgroundColor = RGB_COLOR("#e5e5e5")
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.alwaysBounceVertical = true
        
        let  identifier = "collectionSectionZero"
        homeCollectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: identifier)
        
        homeCollectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionSectionHeader")
        
        homeCollectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "section3")
        
        homeCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        homeCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "otherCell")
        
        homeCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "secondCell")
        self.view.addSubview(homeCollectionView)
    }
    //FIXME:UICollectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 4
    }
    
    //设置区内有多少个item
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 0
        }
        else if section == 1
        {
            return 5
        }
        else if section == 2
        {
            return 6
        }
        else if section == 3
        {
            return 6
        }
        return 0
    }
    
    //设置每个item的大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if indexPath.section == 1
        {
            return CGSizeMake(SCREEN_WIDTH(), 144*(SCREEN_WIDTH()-20)/300+42+10);
        }
        else if indexPath.section == 2
        {
            return CGSizeMake(SCREEN_WIDTH(), 144*(SCREEN_WIDTH()-20)/300+10+10);
        }
        else
        {
            return CGSizeMake((SCREEN_WIDTH()-20-11)/2, (SCREEN_WIDTH()-20-11)/2+85+10);
        }
    }
    
    //设置距离屏幕上左下右的距离
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        if section == 0
        {
            return UIEdgeInsetsMake(0,0,10,0)
        }
        else if section == 1
        {
            return  UIEdgeInsetsMake(0,0,10,0)
        }
        else if section == 2
        {
            return  UIEdgeInsetsMake(0,0,10,0)
        }
        else if section == 3
        {
            return  UIEdgeInsetsMake(0,10,0,10)
        }
        else
        {
            return  UIEdgeInsetsMake(0,0,0,0)
        }

    }
    
    //设置页眉宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if section == 0
        {
            return CGSizeMake(SCREEN_WIDTH(), (169*SCREEN_WIDTH()/320+67.5+5))        }
        else if section == 1
        {
            return  CGSizeMake(SCREEN_WIDTH(), 37)
        }
        else if section == 2
        {
            return  CGSizeMake(SCREEN_WIDTH(), 37)
        }
        else if section == 3
        {
            return  CGSizeMake(SCREEN_WIDTH(), 37)
        }
        else
        {
            return CGSizeMake(SCREEN_WIDTH(), 0)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSizeZero
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
//    {
//        if section == 0
//        {
//            return 0.000001
//        }
//        return 0.0000001
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
//    {
//        return 11.0
//    }
    
    //设置页眉
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        if kind == UICollectionElementKindSectionHeader
        {
            let sectionHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "section3", forIndexPath: indexPath)
            if indexPath.section == 0
            {
                sectionHeaderView.backgroundColor = RGB_COLOR("#A386DA")
            }
            else
            {
                sectionHeaderView.backgroundColor = UIColor.blueColor()
            }
            return sectionHeaderView
        }
        return UICollectionReusableView()
    }
    
    //根据不同的区 建立不同的item
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
    
        if indexPath.section == 1
        {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) 
            cell.backgroundColor = UIColor.redColor()
            return cell
        }
        else if indexPath.section == 2
        {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("otherCell", forIndexPath: indexPath) 
            
            cell.backgroundColor = UIColor.greenColor()
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("secondCell", forIndexPath: indexPath) 
            
            cell.backgroundColor = UIColor.orangeColor()
            return cell
        }
    }
}
