//
//  AppConstants.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

class AppConstants {
    static let shared = AppConstants()
    
    static let API_BASE = (Bundle.main.infoDictionary!["API_BASE"]) as! String
    static let API_PATH = (Bundle.main.infoDictionary!["API_PATH"]) as! String

}
