//
//  PictureManager.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/19.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit
import Foundation
class PictureManager: NSObject {
    func bundleImageName(_ imageName : String) -> UIImage? {
        let bundlePath = Bundle.main.path(forResource: "Swift", ofType: "bundle")
        let imagePath  = "\(bundlePath)\(imageName)"
        let image      = UIImage.init(contentsOfFile: imagePath)
        return image
    }

}
