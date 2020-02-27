//
//  UserModelView.swift
//  WebServices
//
//  Created by Bhargav Anjibabu Borra on 14/02/2020.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
class UserModelView {
    
    //LoginServiceCall
    
    static func SendLoginService(parms: Dictionary<String, Any>,auth: Bool, completionHandler: @escaping (_ error: Error?, _ obj: ModelClass) -> ()) {
        guard let fileUrl = URL(string: Constants.baseUrl) else { return  }
    Datamanager.postMessageToserver(parms: parms, url: fileUrl, type: ModelClass.self, authKey: auth, completionHandler: { (error, data) in
            if error != nil{}else{
                if let modelData = data{
                     completionHandler (error , modelData)
                }
            }
        })
    }
    
    
    //CountrycodeServiceCall
    
    static func SendCountryCodeService(parms: Dictionary<String, Any>,auth: Bool, completionHandler: @escaping (_ error: Error?, _ obj: ModelClass) -> ()) {
    
        guard let fileUrl = URL(string: Constants.baseUrl) else { return  }
        Datamanager.postMessageToserver(parms: parms, url: fileUrl, type: CountryList.self, authKey: auth, completionHandler: { (error, data) in
            if error != nil{}else{
                if let countryData = data{
                     completionHandler (error , countryData)
                }
            }
        })
    }
}

