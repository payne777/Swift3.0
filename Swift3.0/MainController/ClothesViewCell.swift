//
//  ClothesViewCell.swift
//  Swift3.0
//
//  Created by 巴巴罗萨 on 2016/9/30.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

class ClothesViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initSubViews()
    }
    var collectdModel : CollectionViewModel? {
        didSet {
            let price = "\(collectdModel?.money_symbol)\(collectdModel?.taobao_selling_price)"
            priceLabel.text = price
            bgPicture.kf.setImage(with: URL.init(string: (collectdModel?.taobao_pic_url)!), placeholder: UIImage.init(named: "Swift.bundle/placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
            descriptionLab.text = collectdModel?.taobao_title!
        }
    }
    
    
    lazy var bgPicture : UIImageView   = UIImageView()
    lazy var descriptionLab : UILabel  = UILabel ()
    lazy var priceLabel :UILabel = UILabel ()
    
    
    func initSubViews()  {
        self.addSubview(bgPicture)
        self.addSubview(descriptionLab)
        self.addSubview(priceLabel)
        
        bgPicture.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(430/2.0)
        }
        
        descriptionLab.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(7.5)
            make.top.equalTo(bgPicture.snp.bottom).offset(9)
            make.width.equalTo(self.snp.width).offset(-14)
            make.height.equalTo(35)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(7.5)
            make.top.equalTo(descriptionLab.snp.bottom).offset(12)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(12)
        }
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
