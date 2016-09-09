//
//  StoreCollectionViewCell.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/21.
//  Copyright © 2015年 tianxiuping. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell
{
    var userImageView:UIImageView!
    var nameLabel:UILabel!
    
    required init(coder aDecoder: NSCoder)
    {
       super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.creatUI(frame)
    }
    
    func creatUI(frame:CGRect)
    {
        let image = UIImage(named: "icon_goodsManage")
        userImageView = UIImageView(frame: CGRectMake((frame.size.width - image!.size.width)/2, (frame.size.height - image!.size.height-30)/2,image!.size.width,image!.size.height))
        userImageView.image = image
        userImageView.userInteractionEnabled = false
        [self.contentView .addSubview(userImageView)];
        
        nameLabel = UILabel(frame: CGRectMake(0, userImageView.frame.origin.y + userImageView.frame.size.height, frame.size.width, 30))
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 15.0)
        nameLabel.textColor = RGB_COLOR("#333333")
        nameLabel.text = "还没想好名字"
        nameLabel.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(nameLabel)
    }
    
    func getData(imageName:NSString,nameTitle:NSString)
    {
        userImageView.image = UIImage(named: imageName as String)
        nameLabel.text = nameTitle as String
    }
}
