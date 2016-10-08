//
//  TestTableViewCell.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/28.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit
import Kingfisher
//定义闭包的类型
//使用闭包来传值或者传递事件(先定义闭包类型),无参数,无返回类型
typealias ClouseType = ( ) -> Void

//闭包形式二,有参数无返回类型
typealias ClouseTypeTwo = (String) ->Void


//下面使用代理来传递事件
protocol TestTableViewCellDelegate {
   
   func  clickEventOne()
   func  clickEventTwo(_ patameters : String)
}


class TestTableViewCell: UITableViewCell {
    var transClouse : ClouseType?
    var parametersClouse : ClouseTypeTwo?
    var delegate :TestTableViewCellDelegate?
    
    var model : TestCellModel? {
        didSet {
            titleLab.text  = String(model!.title!)
            introlLab.text = String(model!.intro!)
        }
    }
    
    var courseModel : CourseListModel? {
        didSet {
            titleLab.text     = String(courseModel!.CourseName!)
            introlLab.text    = String(courseModel!.SchoolName!)
            let imageString   = String(courseModel!.PhotoURL!)
            //说明:一定要注意,千万不能和OC的NSURL弄混了,否则就坑爹了
            let imageURL      = URL(string: imageString!)
            icon.kf.setImage(with: imageURL, placeholder: UIImage.init(named: "Swift.bundle/placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    lazy var titleLab : UILabel  = UILabel ()
    lazy var introlLab: UILabel  = UILabel ()
    lazy var icon : UIImageView  = UIImageView ()
    lazy var rightBtn : UIButton = UIButton ()
    lazy var btnTwo   : UIButton = UIButton ()
    lazy var sepratorLine : CALayer = CALayer ()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
   override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    titleLab.textAlignment = NSTextAlignment.left
    titleLab.font = UIFont.systemFont(ofSize: 15)
    titleLab.textColor = UIColor.black
    
    icon.backgroundColor = UIColor.clear
    
    introlLab.textAlignment = NSTextAlignment.left
    introlLab.font = UIFont.systemFont(ofSize: 15)
    introlLab.textColor = UIColor.black
    
    rightBtn.setTitle("标题点击", for: .normal)
    rightBtn.setTitleColor(UIColor.blue, for: .normal)
    rightBtn.addTarget(self, action: #selector(transEvent(_:)), for:.touchUpInside)
    rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    
    
    btnTwo.setTitle("内容介绍", for: .normal)
    btnTwo.setTitleColor(UIColor.green, for: .normal)
    btnTwo.addTarget(self, action: #selector(clickEventTwo(_:)), for:.touchUpInside)
    btnTwo.titleLabel?.font = UIFont.systemFont(ofSize: 13)
   
    
    sepratorLine.backgroundColor = UIColor.lightGray.cgColor
    
    
    addSubview(titleLab)
    addSubview(introlLab)
    addSubview(icon)
    addSubview(rightBtn)
    addSubview(btnTwo)
    self.layer.addSublayer(sepratorLine)
    
    icon.snp.makeConstraints { (make) in
        make.left.equalTo(self).offset(10)
        make.width.equalTo(80)
        make.height.equalTo(80)
        make.top.equalTo(self).offset(10)
    }

    
    titleLab.snp.makeConstraints { (make) in
        make.width.equalTo(screenWidth - 100 - 30)
        make.height.equalTo(15)
        make.top.equalTo(10)
        make.left.equalTo(icon.snp.right).offset(10)
    }
    
    introlLab.snp.makeConstraints { (make) in
        make.left.equalTo(titleLab.snp.left)
        make.top.equalTo(titleLab.snp.bottom).offset(10)
        make.width.equalTo(screenWidth - 110)
        make.height.equalTo(titleLab.snp.height)
    }
    
    rightBtn.snp.makeConstraints { (make) in
        make.left.equalTo(self.snp.right).offset(-65)
        make.top.equalTo(self).offset(15)
        make.width.equalTo(55)
        make.height.equalTo(40)
    }
    
    btnTwo.snp.makeConstraints { (make) in
        make.left.equalTo(rightBtn)
        make.top.equalTo(rightBtn.snp.bottom).offset(10)
        make.width.equalTo(55)
        make.height.equalTo(40)
    }
    }
    
    func transEvent(_ button : UIButton)  {
        if self.transClouse != nil {
            self.transClouse!()
        }
        
        if self.delegate != nil {
            delegate?.clickEventOne()
        }
        print("你妹啊")
    }
    
    //此处以为button的title始终有值的,所以直接使用!强制解包
    func clickEventTwo(_ button : UIButton)  {
        if self.parametersClouse != nil {
            self.parametersClouse!(button.currentTitle!)
        }
        
        if self.delegate != nil {
            delegate?.clickEventTwo(button.currentTitle!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init decoder has not been implemnted")
    }
    
    override func layoutSubviews() {
         sepratorLine.frame = CGRect.init(x: 5, y: self.height(self) - 1, width: screenWidth - 10, height: 1.0)
    }
    
    

}
