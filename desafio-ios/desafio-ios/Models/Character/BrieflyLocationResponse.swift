//
//  BrieflyLocationResponse.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

class BrieflyLocationResponse: Codable, Equatable {
    private var name: String?
    private var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    static func == (lhs: BrieflyLocationResponse, rhs: BrieflyLocationResponse) -> Bool {
        return lhs.name == rhs.name &&
        lhs.url == rhs.url
    }
    
    // MARK: Public Methods
    func getName() -> String? {
        return name
    }
    
    func getUrl() -> String? {
        return url
    }
}
