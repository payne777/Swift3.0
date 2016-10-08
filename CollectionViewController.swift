//
//  CollectionViewController.swift
//  Swift3.0
//
//  Created by 巴巴罗萨 on 2016/9/30.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CollectionViewController: UIViewController ,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    var _collectedArray : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "精品时装"
        self.requestData(page: 0)
        self.view.addSubview(collectionView)
    }
    
    lazy var collectionView : UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
       let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.init(colorLiteralRed: 242, green: 242, blue: 242, alpha: 1)
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.register(ClothesViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.mj_header = MJRefreshHeader.init(refreshingBlock: { 
            self.requestData(page: 0)
        })
        return collectionView
    }()
    
    func requestData(page : Int)  {
        let urlString = "http://vapi.yuike.com/1.0/product/quality.php?count=40&cursor=0&mid=457465&sid=be65752c7e4ee53dba4e5f3658fe8d80&type=choice&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5116220"
        
    Alamofire.request("\(urlString)/get").responseJSON { (response) in
        self.collectionView.mj_header.endRefreshing()
        switch response.result {
        case.success(let value):
            var json = JSON(value)
            if  json["msg"] .rawString() == "ok" {
                let tempDic = json["data"].dictionary
                let data = tempDic?["products"]?.arrayObject
                for dict in data! {
                    let colletcModel = CollectionViewModel.init(dic: dict as! [String : AnyObject])
                    self._collectedArray.add(colletcModel)
                }
                self.collectionView.reloadData()
            }
        case.failure(let error):
            print("错误信息为\(error.localizedDescription)")
        }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _collectedArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? ClothesViewCell
        let model = _collectedArray[indexPath.row] as? CollectionViewModel
        cell?.collectdModel = model
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(7.0, 7.0, 7.0, 7.0);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (screenWidth-4 * 3)/2.0, height: 587/2.0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
}
