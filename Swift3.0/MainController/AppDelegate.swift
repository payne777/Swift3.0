//
//  AppDelegate.swift
//  Learn
//
//  Created by 巴巴罗萨 on 2016/9/28.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.setUpSubViews()
        self.window?.makeKeyAndVisible()
        return true
    }

    
    func setUpSubViews () {
        let homeVC  = ViewController()
        let homeNav = UINavigationController.init(rootViewController: homeVC)
        homeNav.tabBarItem.title = "首页"
        homeNav.tabBarItem.image = UIImage.init(named: "Swift.bundle/homeUnselected")
        
        let movieVC  = MovieViewController()
        let movieNav = UINavigationController.init(rootViewController: movieVC)
        movieNav.tabBarItem.title = "电影"
        movieNav.tabBarItem.image = UIImage.init(named: "Swift.bundle/movieUnselected")
        
        let courseVC  = CourseViewController()
        let courseNav = UINavigationController.init(rootViewController: courseVC)
        courseNav.tabBarItem.title = "课堂"
        courseNav.tabBarItem.image = UIImage.init(named: "Swift.bundle/我的")
        
        let  tabbar = UITabBarController.init()
        tabbar.setViewControllers([homeNav,movieNav,courseNav], animated: true)
        //此句代码可以一次性改变,选中item上的标题以及图片的颜色
        UITabBar.appearance().tintColor = UIColor.init(red: 158/255, green: 13/255, blue: 30/255, alpha: 1)
        self.window?.rootViewController = tabbar
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

