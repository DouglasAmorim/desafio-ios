//
//  BrieflyLocationResponseTests.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import desafio_ios

final class BrieflyLocationResponseTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testDecodeData() throws {
        let dictionary: [String: Any] = ["name": "earth", "url": "https://earth.com"]
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            let characterFilter = try JSONDecoder().decode(BrieflyLocationResponse.self, from: data)
            
            XCTAssertEqual(characterFilter.getName(), "earth")
            XCTAssertEqual(characterFilter.getUrl(), "https://earth.com")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testBrieflyLocation_GetsAndSets() throws {
        let brieflyLocationResponse = BrieflyLocationResponse()
        brieflyLocationResponse.setName(name: "earth")
        brieflyLocationResponse.setUrl(url: "https://earth.com")
        
        XCTAssertEqual(brieflyLocationResponse.getName(), "earth")
        XCTAssertEqual(brieflyLocationResponse.getUrl(), "https://earth.com")
    }
    
    func testEquality() throws {
        let location = BrieflyLocationResponse()
        location.setName(name: "earth")
        location.setUrl(url: "https://earth.com")
        
        let location2 = BrieflyLocationResponse()
        location2.setName(name: "earth")
        location2.setUrl(url: "https://earth.com")
        
        XCTAssertTrue(location == location2)
    }
}
