////
////  LoginJsonModel.swift
////  WebServices
////
////  Created by Bhargav Anjibabu Borra on 14/02/2020.
////  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
////
//
//import Foundation
//
struct  ModelClass: Codable {

    let responseCode : String?
    let responseMessage : String?
    let resposeData : ResposeDataOne?

    enum CodingKeys: String, CodingKey {

        case responseMessage = "responseMessage"
        case responseCode = "responseCode"
        case resposeData =  "responseData"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        responseMessage = try values.decodeIfPresent(String.self, forKey: .responseMessage)
        responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
        resposeData = try values.decodeIfPresent(ResposeDataOne.self, forKey: .resposeData)
    }

}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let model = try? newJSONDecoder().decode(ModelClass.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Model
//struct ModelClass: Codable {
//    let responseCode, responseMessage, responseDescription: String
//    let responseData: ResponseData
//}
//
//// MARK: - ResponseData
//struct ResponseData: Codable {
//    let productsEnable: [String]
//    let sessionID, merchantName, merchantID, appVersion: String
//    let preAuth, hostType, deviceID, tid: String
//    let mid, tc, connectType, appStatus: String
//    let merchantType, deviceStatus, deviceExpiry, deviceRenewal: String
//    let ezypassDeviceStatus, ezypassDeviceExpiry, ezypassDeviceRenewal, enableBoost: String
//    let enableMoto, enableEzypass, enableEzywire, enableEzyrec: String
//    let motoTid, ezypassTid, ezyrecTid, gpayTid: String
//    let motoMid, ezypassMid, ezyrecMid, gpayMid: String
//    let enableGrabPay, mobileUserID: String
//
//    enum CodingKeys: String, CodingKey {
//        case productsEnable
//        case sessionID = "sessionId"
//        case merchantName
//        case merchantID = "merchantId"
//        case appVersion, preAuth, hostType
//        case deviceID = "deviceId"
//        case tid, mid, tc, connectType, appStatus, merchantType, deviceStatus, deviceExpiry, deviceRenewal, ezypassDeviceStatus, ezypassDeviceExpiry, ezypassDeviceRenewal, enableBoost, enableMoto, enableEzypass, enableEzywire, enableEzyrec, motoTid, ezypassTid, ezyrecTid, gpayTid, motoMid, ezypassMid, ezyrecMid, gpayMid, enableGrabPay
//        case mobileUserID = "mobileUserId"
//    }
//}



