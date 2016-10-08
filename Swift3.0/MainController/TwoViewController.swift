//
//  TwoViewController.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/19.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



let testCellIdentifier = "TestCellIdentifier"
let urlString = "http://pop.client.chuanke.com/?mod=recommend&act=mobile&client=2&limit=20"


class TwoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TestTableViewCellDelegate {
    var modelArray : NSMutableArray = NSMutableArray ()
    var DataArray  : NSMutableArray = NSMutableArray()
    
//    let dicOne   = ["title":"李白","intro":"李白是一名伟大的诗人"]
//    let dicTwo   = ["title":"王维","intro":"王维是一名和李白具有相同盛名的大神"]
//    let dicThree = ["title":"杜甫","intro":"杜甫诗唐朝的,曾经梦回唐朝"]
//    let dicFour  = ["title":"骆宾王","intro":"此人才初唐四杰之一,七岁便能写诗,著名的咏鹅就是儿时所写"]
//    let dicFive  = ["title":"李商隐","intro":"is a famous poet in Tang dynasty"]
    let infoArray :Array = [["title":"李白","intro":"李白是一名伟大的诗人"],["title":"王维","intro":"王维是一名和李白具有相同盛名的大神"],["title":"杜甫","intro":"杜甫诗唐朝的,曾经梦回唐朝"],["title":"骆宾王","intro":"此人才初唐四杰之一,七岁便能写诗,著名的咏鹅就是儿时所写"],["title":"李商隐","intro":"is a famous poet in Tang dynasty"],["title":"","intro":""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "测试TableView"
        self.view.addSubview(tableView)
        for tempDic : Dictionary in infoArray {
            let model = TestCellModel.init(dict: tempDic as [String : AnyObject])
            modelArray.add(model)
        }
        self.networkRequest(urlString: urlString)
    }
    // MARK: Network Request
    func networkRequest(urlString:String)  {
        self.showTipMsg(msg: "数据加载中...")
        Alamofire.request("\(urlString)/get").responseJSON { (response) in
            self.tableView.mj_header.endRefreshing()
             self.hideTipMsg()
            switch response.result {
            case.success(let value) :
                
                let json = JSON(value)
                if let data = json["CourseList"].arrayObject {
                    for dict in data {
                        let courseModel = CourseListModel.init(params: dict as! [String : AnyObject])
                        self.DataArray.add(courseModel)
                    }
                    self.tableView.reloadData()
                }
            case.failure(let error):
                self.shoeErrorMsg(msg: "加载失败,请检查网络")
                print(error)
            }
        }
    }

    // MARK: Delegate And Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return modelArray.count
        return DataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell      = tableView.dequeueReusableCell(withIdentifier: testCellIdentifier) as! TestTableViewCell
        cell.delegate = self
//        let model     = modelArray[indexPath.row] as? TestCellModel
//        cell.model    = model
        if DataArray.count > 0 {
            let courseModel  = DataArray[indexPath.row] as? CourseListModel
            cell.courseModel = courseModel

        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.transClouse = {
            print("这个闭包可以????")
        }
        cell.parametersClouse = { (patames : String) -> Void in
            
            let collectionVC = CollectionViewController()
            collectionVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(collectionVC, animated: true)
            print("这个是闭包啊,好像block哦,感觉就是堂兄弟啊,参数\(patames)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击的是哪一行的啊?\(indexPath.row + 1)")
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    lazy var tableView :UITableView =  {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight  ), style: .plain)
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: testCellIdentifier)
        //引用OC MJ
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
        self.networkRequest(urlString: urlString)
       })
        return tableView
    }()
    
    //-----delegate
    func clickEventOne() {
        print("这是老子用代理搞过来的,不服不服")
    }

    func clickEventTwo(_ patameters: String) {
        print("这是大爷我用代理弄来的还带参数的呵呵哒\(patameters)")
    }
    
    func showTipMsg(msg : String)  {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = msg
        hud.hide(animated: true, afterDelay: 30)
    }
    
    func hideTipMsg()  {
        for subview in self.view.subviews {
            if subview.isKind(of: MBProgressHUD.self) {
                let hudView = subview as? MBProgressHUD
                hudView?.hide(animated: true)
            }
        }
        
    }
    func shoeErrorMsg(msg : String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = msg
        hud.hide(animated: true, afterDelay: 2)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
