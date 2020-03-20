//
//  ResposeData.swift
//  WebServices
//
//  Created by admin on 22/02/2020.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import UIKit

struct ResposeDataOne : Codable {

    let appStatus : String?
    let appVersion : String?
    let productsEnable : Array<String>?


       enum CodingKeys: String, CodingKey {

           case appStatus = "appStatus"
           case appVersion = "appVersion"
           case productsEnable = "productsEnable"
       }

       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           appStatus = try values.decodeIfPresent(String.self, forKey: .appStatus)
           appVersion = try values.decodeIfPresent(String.self, forKey: .appVersion)
           productsEnable  = try values.decodeIfPresent(Array.self, forKey: .productsEnable)

       }

}
