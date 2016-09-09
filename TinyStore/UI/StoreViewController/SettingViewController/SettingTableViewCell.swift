//
//  SettingTableViewCell.swift
//  TinyStoreSwift
//
//  Created by tianxiuping on 15/9/21.
//  Copyright © 2015年 tianxiuping. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.creatUI()
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func creatUI()
    {
        self.textLabel?.text = "功能介绍"
    }
}
