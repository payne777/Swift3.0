//
//  CollectionViewModel.swift
//  Swift3.0
//
//  Created by 巴巴罗萨 on 2016/9/30.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

class CollectionViewModel: NSObject {
    var taobao_num_iid:String?
    var taobao_title:String?
    var taobao_prices:String?
    var taobao_promo_price:String?
    var taobao_selling_price:String?
    var money_symbol:String?
    var integral:NSNumber?
    var taobao_url:String?
    var mobile_cps_url:String?
    var pc_cps_url:String?
    var tag_type:String?
    var tag_url:String?
    var taobao_delist_time:String?
    var taobao_pic_url:String?
    var taobao_item_imgs :NSArray?
    var taobao_volume:NSNumber?
    var visits_count:NSNumber?
    var comments_count:String?
    var likes_count:NSNumber?
    var share_count:String?
    var product_id:String?
    var is_deleist:String?
    var discount:String?
    var quality_score:NSNumber?
    var price_score:String?
    var conform_score:NSNumber?
    var synthesis_score:NSNumber?
    var merchant :NSDictionary?
    var brand:  NSDictionary?
    var from_title:String?
    var from_logo_url: String?
    var from_type: String?
    
    init(dic:[String : AnyObject]) {
         super.init()
        self.taobao_num_iid  = dic["taobao_num_iid"] as! String?
        self.taobao_title    = dic["taobao_title"]as! String?
        self.taobao_prices   = dic["taobao_prices"]as! String?
        self.taobao_promo_price   = dic["taobao_promo_price"]as! String?
        self.taobao_selling_price = dic["taobao_selling_price"]as! String?
        self.money_symbol    = dic["money_symbol"]as! String?
        self.integral        = dic["integral"]as! NSNumber?
        self.taobao_url      = dic["taobao_url"]as! String?
        self.mobile_cps_url  = dic["mobile_cps_url"]as! String?
        self.pc_cps_url      = dic["pc_cps_url"]as! String?
        self.tag_type        = dic["tag_type"]as! String?
        self.tag_url         = dic["tag_url"]as! String?
        self.taobao_delist_time = dic["taobao_delist_time"]as! String?
        self.taobao_pic_url     = dic["taobao_pic_url"]as! String?
        self.taobao_item_imgs   = dic["taobao_item_imgs"]as! NSArray?
        self.taobao_volume      = dic["taobao_volume"]as! NSNumber?
        self.visits_count       = dic["visits_count"]as! NSNumber?
        self.comments_count      = dic["comments_count"]as! String?
        self.likes_count = dic["likes_count"]as! NSNumber?
        self.share_count = dic["share_count"]as! String?
        self.product_id  = dic["product_id"]as! String?
        self.is_deleist  = dic["is_deleist"]as! String?
        self.discount    = dic["discount"]as! String?
        self.quality_score   = dic["quality_score"]as! NSNumber?
        self.conform_score   = dic["conform_score"]as! NSNumber?
        self.synthesis_score = dic["synthesis_score"]as! NSNumber?
        self.merchant = dic["merchant"]as! NSDictionary?
        self.brand    = dic["brand"]as! NSDictionary?
        self.from_title    = dic["from_title"]as! String?
        self.from_logo_url = dic["from_logo_url"]as! String?
        self.from_type     = dic["from_type"]as! String?
    }
}
