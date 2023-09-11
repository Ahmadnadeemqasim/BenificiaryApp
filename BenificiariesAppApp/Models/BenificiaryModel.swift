//
//  Benificiary.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/9/23.
//


import Foundation

//
//  Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - BenificiaryElement
struct Benificiary: Codable {
    var lastName: String?
    var firstName: String?
    var designationCode: String?
    var beneType: String?
    var socialSecurityNumber: String?
    var dateOfBirth: String?
    var middleName: String?
    var phoneNumber: String?
    var beneficiaryAddress: BeneficiaryAddress?

    enum CodingKeys: String, CodingKey {
        case lastName = "lastName"
        case firstName = "firstName"
        case designationCode = "designationCode"
        case beneType = "beneType"
        case socialSecurityNumber = "socialSecurityNumber"
        case dateOfBirth = "dateOfBirth"
        case middleName = "middleName"
        case phoneNumber = "phoneNumber"
        case beneficiaryAddress = "beneficiaryAddress"
    }
}

//
//  Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - BeneficiaryAddress
struct BeneficiaryAddress: Codable {
    var firstLineMailing: String?
    var scndLineMailing: String?
    var city: String?
    var zipCode: String?
    var stateCode: String?
    var country: String?

    enum CodingKeys: String, CodingKey {
        case firstLineMailing = "firstLineMailing"
        case scndLineMailing = "scndLineMailing"
        case city = "city"
        case zipCode = "zipCode"
        case stateCode = "stateCode"
        case country = "country"
    }
}

