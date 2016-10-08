//
//  TestCellModel.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/28.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

class TestCellModel: NSObject {
    var title :  String?
    var intro :  String?
    init(dict : [String :AnyObject]) {
        super.init()
        title = dict["title"] as? String
        intro = dict["intro"] as? String
    }
    
}
