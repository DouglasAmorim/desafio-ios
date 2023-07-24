//
//  InformationResponse.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

class InformationResponse: Codable, Equatable {
    private var itemAmount: Int?
    private var pageAmount: Int?
    private var urlNextPage: String?
    private var urlPreviousPage: String?
    
    enum CodingKeys: String, CodingKey {
        case itemAmount = "count"
        case pageAmount = "pages"
        case urlNextPage = "next"
        case urlPreviousPage = "prev"
    }
    
    static func == (lhs: InformationResponse, rhs: InformationResponse) -> Bool {
        return lhs.itemAmount == rhs.itemAmount &&
        lhs.pageAmount == rhs.pageAmount &&
        lhs.urlNextPage == rhs.urlNextPage &&
        lhs.urlPreviousPage == rhs.urlPreviousPage
    }
    
    // MARK: Public Methods
    func getItemAmount() -> Int? {
        return itemAmount
    }
    
    func getPageAmount() -> Int? {
        return pageAmount
    }
    
    func getUrlNextPage() -> String? {
        return urlNextPage
    }
    
    func getUrlPreviousPage() -> String? {
        return urlPreviousPage
    }
    
    func setItemAmount(itemAmount: Int) {
        self.itemAmount = itemAmount
    }
    
    func setPageAmount(pageAmount: Int) {
        self.pageAmount = pageAmount
    }
    
    func setUrlNextPage(nextPage: String?){
        self.urlNextPage = nextPage
    }
    
    func setUrlPreviousPage(prevPage: String?) {
        self.urlPreviousPage = prevPage
    }
}
