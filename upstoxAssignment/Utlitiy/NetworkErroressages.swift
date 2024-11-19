//
//  NetworkErroressages.swift
//  upstoxAssignment
//
//  Created by K V Jagadeesh babu on 18/11/24.
//

import Foundation

enum ShowErrormessage: LocalizedError, Error {
    case invalidURL
    case invalidStatusCode
    case invalidData
    
    var erroList: String {
        switch self {
        case .invalidURL : "Invalid url"
        case .invalidStatusCode: "Invalid statusCode"
        case.invalidData: "Invalid Data"
        }
    }
}
