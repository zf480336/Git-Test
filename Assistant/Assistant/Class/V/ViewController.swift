//
//  ViewController.swift
//  Assistant
//
//  Created by lxy on 2018/11/26.
//  Copyright © 2018年 lxy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    var loginVm:LoginVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewSetCorner.setCornerRadius(corner: Int(self.LoginBtn.bounds.size.height/2), view: self.LoginBtn)
        self.nameField.text = "zhaofa"
        self.pwdField.text = "123456"
//        self.nameField.text = "fangjingyu "
//        self.pwdField.text = "admin666666"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldValueChanged(noti:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }

    
    @objc fileprivate func textFieldValueChanged(noti:NSNotification) -> Void {
        let field = noti.object as! UITextField;
        if (field.markedTextRange != nil) {
            return;
        }
        if (field.text?.contains(" "))! {
            field.text = field.text?.replacingOccurrences(of: " ", with: "")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


    @IBAction func pressLoginBtn(_ sender: UIButton) {

//        let detailController = GoodsKeyInViewController.init(style: UITableViewStyle.grouped)
//        self.present(detailController, animated: true, completion: nil)
        
        self.loginVm = LoginVM.init()
        self.loginVm?.params.setValue(self.nameField.text, forKey: "userName")
        self.loginVm?.params.setValue(MD5.string(withMd5: MD5.string(withMd5: self.pwdField.text)), forKey: "password")
        self.loginVm?.setRequestDic()
        self.loginVm?.LoginToAssistant(dic: (self.loginVm?.data)!)
        
    }
    
    func dicValueString(_ dic:[String : Any]) -> String?{
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        let str = String(data: data, encoding: String.Encoding.utf8)
        return str
    }

}

