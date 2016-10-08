//
//  SaveManager.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/19.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

class SaveManager: NSObject {
    
    func saveUserInfo(_ account : String ,password : String)  {
        let userDefaults = UserDefaults.standard
        userDefaults.set(account, forKey:accountString )
        userDefaults.set(password, forKey: passwordString)
        userDefaults.synchronize()
    }
    
    func getUserInfo () -> (account : String? ,password : String?) {
        let userDefaults = UserDefaults.standard
        let tempA = userDefaults.object(forKey: accountString)
        let tempB = userDefaults.object(forKey: passwordString)
        return (tempA as? String,tempB as? String)
//        let a : String = String(describing: userDefaults.object(forKey: accountString))
//        let b : String = String(describing: userDefaults.object(forKey: passwordString))
//        return (a,b)
    }
    
    
    
    

}
