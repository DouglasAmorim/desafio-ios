//
//  InformationResponseTests.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import desafio_ios

final class InformationResponseTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func testDecodedData() throws {
        let dictionary: [String: Any] = ["count": 666, "pages": 66, "next": "https://next", "prev": "http://prev"]
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            let characterFilter = try JSONDecoder().decode(InformationResponse.self, from: data)
            
            XCTAssertEqual(characterFilter.getItemAmount(), 666)
            XCTAssertEqual(characterFilter.getPageAmount(), 66)
            XCTAssertEqual(characterFilter.getUrlNextPage(), "https://next")
            XCTAssertEqual(characterFilter.getUrlPreviousPage(), "http://prev")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testInformation_GetsAndSets() throws {
        let informationResponse = InformationResponse()
        informationResponse.setItemAmount(itemAmount: 666)
        informationResponse.setPageAmount(pageAmount: 66)
        informationResponse.setUrlNextPage(nextPage: "https://next")
        informationResponse.setUrlPreviousPage(prevPage: "http://prev")
        
        XCTAssertEqual(informationResponse.getItemAmount(), 666)
        XCTAssertEqual(informationResponse.getPageAmount(), 66)
        XCTAssertEqual(informationResponse.getUrlNextPage(), "https://next")
        XCTAssertEqual(informationResponse.getUrlPreviousPage(), "http://prev")
    }
    
    func testEquality() throws {
        let informationResponse1 = InformationResponse()
        informationResponse1.setItemAmount(itemAmount: 666)
        informationResponse1.setPageAmount(pageAmount: 66)
        informationResponse1.setUrlNextPage(nextPage: "https://next")
        informationResponse1.setUrlPreviousPage(prevPage: "http://prev")
        
        let informationResponse2 = InformationResponse()
        informationResponse2.setItemAmount(itemAmount: 666)
        informationResponse2.setPageAmount(pageAmount: 66)
        informationResponse2.setUrlNextPage(nextPage: "https://next")
        informationResponse2.setUrlPreviousPage(prevPage: "http://prev")
        
        XCTAssertTrue(informationResponse1 == informationResponse2)
    }
}
