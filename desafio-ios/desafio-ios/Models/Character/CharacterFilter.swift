//
//  CharacterFilter.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation

class CharacterFilter: Codable, Equatable {
    private var page: String = ""
    private var name: String = ""
    private var status: String = ""
    
    enum CodingKeys: String, CodingKey {
        case page
        case name
        case status
    }
    
    static func == (lhs: CharacterFilter, rhs: CharacterFilter) -> Bool {
        return lhs.page == rhs.page &&
        lhs.name == rhs.name &&
        lhs.status == rhs.status
    }
    
    // MARK: Public Methods
    func setPage(page: String) {
        self.page = page
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setStatus(status: String) {
        self.status = status
    }
    
    func getPage() -> String {
        return page
    }
    
    func getName() -> String {
        return name
    }
    
    func getStatus() -> String {
        return status
    }
}
