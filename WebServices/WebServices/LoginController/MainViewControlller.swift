//
//  ViewController.swift
//  WebServices
//
//  Created by Bhargav Anjibabu Borra on 13/02/2020.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import UIKit

class MainViewControlller: UIViewController {
    
    @IBOutlet weak var alrtV: UIView!
    @IBOutlet var uNameFld: UITextField!
    @IBOutlet var PwFld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
     @"service":@"LOGIN_MOB",
     
     @"username":"mobi0100",
     
     @"password":"abc123",
     
     @"appVersionNum":@"5.4",
     
     @"authType":"",
     
     @"biomerticKey":"SUCCESS",
     
     @"deviceType":@"IOS",
     
     @"deviceToken":""
     */
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        var dic : Dictionary<String, Any>
        
        let Uname = uNameFld.text
        let pw = PwFld.text
        dic = ["service":"LOGIN_MOB", "username" : "sdfgsd"  ,"password": pw ?? "", "appVersionNum" : "5.4", "authType":"", "deviceType" : "IOS" , "biomerticKey" :"FAILURE", "deviceToken" :"c0a7d5fcbd720069d7ca99e32e1bee0618ede3d90dec20b6f4d7fecf78d5ae87"]
        
        UserModelView.SendLoginService(parms: dic, auth: false) { (error, data) in
            print(data)
            
            DispatchQueue.main.sync {
               
              let alert = Alert()
                self.alrtV.addSubview(alert)
                
                  //alert .dataTable = UITableView()
                
                           alert.translatesAutoresizingMaskIntoConstraints = false
                           alert.leadingAnchor.constraint(equalTo: self.alrtV!.leadingAnchor, constant: 0).isActive = true
                                  alert.trailingAnchor.constraint(equalTo: self.alrtV!.trailingAnchor, constant: 0).isActive = true
                                  alert.topAnchor.constraint(equalTo: self.alrtV!.topAnchor, constant: 0).isActive = true
                           alert.bottomAnchor.constraint(equalTo: self.alrtV!.bottomAnchor, constant: 0).isActive = true
                
//                alert.dispalyTableviewithArray(arr: data.responseData.productsEnable )
            }
        }
    }
}



