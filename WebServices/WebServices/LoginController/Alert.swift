//
//  Alert.swift
//  WebServices
//
//  Created by admin on 22/02/2020.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import UIKit
import Foundation


class Alert: UIView  {
    
    var tablArr = Array<String>()
    // @IBOutlet  var tablView: UITableView!
    
    @IBOutlet var proTable: UITableView!
    @IBOutlet var dataTable: UITableView!
    
    var tableView: UITableView = UITableView()
    //let animals = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    func dispalyTableviewithArray(arr: Array<String>)  {
        tablArr = arr
        //print(tablArr)
         tableView.frame = CGRect(x: 20,y: 20,width: 300,height: 200)
         tableView.delegate = self
         tableView.dataSource = self
                
        addSubview(tableView)

    }
    
    
}
extension Alert : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        if self.tablArr.count > 0 {
            cell?.textLabel!.text = self.tablArr[indexPath.row]
        }
        cell?.textLabel?.numberOfLines = 1
        
        return cell!
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexArr =  tablArr[indexPath.row]

        print(indexArr)
       
    }
    
    func getCurrentViewController() -> UIViewController? {

        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil

    }
       
}
