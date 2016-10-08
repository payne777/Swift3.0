//
//  UIView+Frame.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/19.
//  Copyright © 2016年 dass. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func left (_ object : UIView) -> CGFloat {
        return object.frame.origin.x
    }
    
    func right (_ object : UIView) -> CGFloat {
        return (object.frame.size.width + object.frame.origin.x)
    }
    
    func top (_ object : UIView) -> CGFloat {
        return object.frame.origin.x
    }
    
    func bottom (_ object : UIView) -> CGFloat {
        return (object.frame.size.height + object.frame.origin.y)
    }
    
    func width (_ object: UIView) -> CGFloat {
        return object.frame.size.width
    }
    
    func height (_ object : UIView) -> CGFloat {
        return object.frame.size.height
    }
    
    
}
