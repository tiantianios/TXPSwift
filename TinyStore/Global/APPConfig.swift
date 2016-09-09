//
//  APPConfig.swift
//  PathDynamicModal-Demo
//
//  Created by tianxiuping on 15/9/18.
//  Copyright (c) 2015年 Ryo Aoyama. All rights reserved.
//

import UIKit



func isiPhone4() ->Bool
{
    return CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(320, 480))
}

func isiPhone5() ->Bool
{
    return CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(320, 568))
}

func isiPhone6() ->Bool
{
    return CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(375, 667))
}

func isiPhone6P() ->Bool
{
    return CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(414, 736))
}

func barBtnSize() ->CGSize
{
    return CGSizeMake(60.0, 40.0)
}

//版本ios 8（包括ios8）以上
func IOS8_OR_LATER() ->Bool
{
    switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch)
    {
        case .OrderedSame, .OrderedDescending:
        return true
        
        case .OrderedAscending:
        return false
    }
}

func IOS7_OR_LATER() ->Bool
{
    switch UIDevice.currentDevice().systemVersion.compare("7.0.0", options: NSStringCompareOptions.NumericSearch)
    {
    case .OrderedSame, .OrderedDescending:
        return true
        
    case .OrderedAscending:
        return false
    }
}

func SCREEN_WIDTH() ->CGFloat
{
    return UIScreen.mainScreen().bounds.size.width
}

func SCREEN_HEIGHT() ->CGFloat
{
    return UIScreen.mainScreen().bounds.size.height
}

func VIEW_TOP_HEIGHT() ->CGFloat
{
    return IOS7_OR_LATER() ? 64.0 : 44.0
}

//普通色值
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) ->UIColor
{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

//16进制色值 RGB_COLOR ("#666666")或 RGB_COLOR ("666666")
func RGB_COLOR (hex:String) -> UIColor
{
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    
    if (cString.hasPrefix("#"))
    {
        cString = (cString as NSString).substringFromIndex(1)
    }
    
    if cString.characters.count != 6
    {
        return UIColor.grayColor()
    }
    
    let rString = (cString as NSString).substringToIndex(2)
    let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
    let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string: rString).scanHexInt(&r)
    NSScanner(string: gString).scanHexInt(&g)
    NSScanner(string: bString).scanHexInt(&b)
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
}


