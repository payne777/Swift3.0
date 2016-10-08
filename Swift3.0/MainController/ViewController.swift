//
//  ViewController.swift
//  Swift 3.0 学习
//
//  Created by 巴巴罗萨 on 2016/9/19.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var nameText : UITextField = UITextField ()
    var paswText : UITextField = UITextField ()
    let manager = SaveManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.setUpSubViews()
    }
    
    func setUpSubViews()  {
        let nameLabel = UILabel.init(frame: CGRect.init(x: 10, y: 80, width: 50, height: 20))
        nameLabel.text = "用户名:";
        nameLabel.font = UIFont.systemFont(ofSize:13.0)
        print(nameLabel.frame)
        self.view.addSubview(nameLabel);
        
        let userInfo = manager.getUserInfo()
        
        nameText = UITextField.init(frame: CGRect.init(x: nameLabel.right(nameLabel), y: 80, width: screenWidth - 80, height: 30))
        nameText.placeholder = "请输入用户名";
        nameText.text = userInfo.account
        nameText.font = UIFont.systemFont(ofSize: 13.0)
        nameText.delegate = self;
        nameText.returnKeyType = UIReturnKeyType.next
        nameText.borderStyle   = UITextBorderStyle.roundedRect
        nameText.layer.borderColor  = UIColor.lightGray.cgColor;
        nameText.tag = 5;
        self.view.addSubview(nameText)
        
        let paswLabel = UILabel.init(frame: CGRect.init(x: nameLabel.left(nameLabel), y: nameText.bottom(nameText) + 30, width: nameLabel.width(nameLabel), height: 30))
        paswLabel.text = "密码:"
        paswLabel.font = UIFont.systemFont(ofSize:13.0)
        self.view.addSubview(paswLabel)
        self.paswText = UITextField.init(frame: CGRect.init(x: paswLabel.right(paswLabel) , y: nameText.bottom(nameText) + 30, width: nameText.width(nameText), height: nameText.height(nameText)))
        paswText.placeholder = "请输入密码";
        if let account = userInfo.account {
            nameText.text = account
        }
        
        paswText.keyboardType = UIKeyboardType.default
        paswText.returnKeyType = UIReturnKeyType.done
        paswText.borderStyle   = UITextBorderStyle.roundedRect
        if let password = userInfo.password {
            paswText.text = password
        }

        paswText.layer.borderColor  = UIColor.lightGray.cgColor;
        paswText.delegate = self;
        paswText.tag = 10;
        self.view.addSubview(paswText)
        
        let sendBtn = UIButton.init(frame: CGRect.init(x: (screenWidth - 80)/2.0, y: (screenHeight - 35)/2.0, width: 80, height: 35))
        sendBtn.setTitle("登录", for: .normal)
        sendBtn.backgroundColor = UIColor.red
        sendBtn.setTitleColor(UIColor.white, for: .normal)
        sendBtn.addTarget(self, action: #selector(loginAction(button:)), for: .touchUpInside)
        self.view.addSubview(sendBtn)
        
        let nextBtn = UIButton.init(frame: CGRect.init(x: sendBtn.left(sendBtn), y: sendBtn.bottom(sendBtn) + 30 , width: sendBtn.width(sendBtn), height: sendBtn.height(sendBtn)))
        nextBtn.tag = 100
        nextBtn.setTitle("下一页", for:.normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        nextBtn.addTarget(self, action: #selector(nextClickEvent(button:)), for: .touchUpInside)
        nextBtn.backgroundColor = UIColor.red
        self.view.addSubview(nextBtn)
    }
    
    func loginAction (button : UIButton )  {
        print("这是什么东西啊")
        if (nameText.text?.characters.count)! < 1 {
            self.showAlert(alertMessage: "请输入用户名")
            return
        }
        if (paswText.text?.characters.count)! < 1 {
            self.showAlert(alertMessage: "请输入密码")
            return
        }
        self.makeKeyBoardDown()
        self.loginWithParameters(userName:nameText.text!, password:paswText.text!)
        manager.saveUserInfo(nameText.text!, password: paswText.text!)
        
        let twoVC = TwoViewController()
        twoVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(twoVC, animated: true)
        
    }

    func loginWithParameters(userName: String ,password : String)  {
        
        print("用户名为:\(userName)\n密码为:\(password)")
    }
    
    func nextClickEvent(button : UIButton) {
        self.makeKeyBoardDown()
        print("点击的按钮为:\(button)")
    }
    
    func makeKeyBoardDown()  {
        
        nameText.resignFirstResponder()
        paswText.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameText {
            nameText.resignFirstResponder()
            paswText.becomeFirstResponder()
            return false
        } else {
            paswText.resignFirstResponder()
            return true
        }
    }
    
    func showAlert (alertMessage : String)  {
        let alertController = UIAlertController.init(title: "Tips", message: "\(alertMessage)信息不完整", preferredStyle: .alert)
        let cancel   = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        let magAlert = UIAlertAction.init(title: "知道了", style: .default) { _ in
            print("这是我点击知道了后的回调通知")
        }
        alertController.addAction(cancel)
        alertController.addAction(magAlert)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
    }

}

