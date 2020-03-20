
import Foundation

// MARK: - CountryModel
struct CountryList: Codable {
    let responseCode, responseMessage, responseDescription: String
//    let responseData: ResponseData
}

// MARK: - ResponseData
struct ResponseDataCountryList: Codable {
    let country: [Country]
}

// MARK: - Country
struct Country: Codable {
    let countryCode, countryName, countryISO, phoneCode: String

    enum CodingKeys: String, CodingKey {
        case countryCode, countryName
        case countryISO = "countryIso"
        case phoneCode
    }
}
