//
//  DataManager.swift
//  WebServices
//
//  Created by Bhargav Anjibabu Borra on 13/02/2020.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation

class Datamanager {
    
    //Get
    static func GetDataFromServer<T:Decodable>(url: URL, type: T.Type, completionHandler: @escaping (_ error: Error?, _ obj: T?) -> ())
    {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
         
            if error != nil{
                completionHandler(error,nil)
                return
            }
            do{
                let dataObjval = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(nil,dataObjval)
                print(dataObjval)
                
            }catch let error {
                completionHandler(error,nil)
            }
        }.resume()
    }
    
    
    //Post
    static func postMessageToserver<T: Decodable>(parms: Dictionary<String, Any>, url: URL, type: T.Type,authKey: Bool, completionHandler: @escaping ( _ error: Error?,  _ obj: T?) -> ()) {
        var request = URLRequest(url: url)
       // print(parms)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parms, options: []) else {
            return
        }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

                    {
                       print(jsonArray) // use the json here
                    } else {
                        print("bad json")
                    }
                    
                    
                   let dataObj = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(nil, dataObj)
                    
                    print(dataObj)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
}
