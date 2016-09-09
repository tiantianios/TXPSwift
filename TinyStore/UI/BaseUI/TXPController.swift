//
//  TXPController.swift
//  PathDynamicModal-Demo
//
//  Created by tianxiuping on 15/9/17.
//  Copyright (c) 2015年 Ryo Aoyama. All rights reserved.
//

import UIKit

class TXPController: NSObject {
    
    func createLabel(frame: CGRect , labText: NSString,labFont: UIFont) ->UILabel
    {
        let myLabel = UILabel (frame: frame)
        myLabel.text = labText as String
        myLabel.font = labFont
        myLabel.textColor = UIColor.blackColor()
        myLabel.backgroundColor = UIColor.clearColor()
        return myLabel
    }
}
