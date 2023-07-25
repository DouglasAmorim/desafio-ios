//
//  CharacterFilterTest.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import desafio_ios

final class CharacterFilterTest: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func testDecodeData() throws {
        let dictionary: [String: Any] = ["page": "1", "name": "rick", "status": "alive"]
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            let characterFilter = try JSONDecoder().decode(CharacterFilter.self, from: data)
            
            XCTAssertEqual(characterFilter.getName(), "rick")
            XCTAssertEqual(characterFilter.getPage(), "1")
            XCTAssertEqual(characterFilter.getStatus(), "alive")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCharacterFilter_GetsAndSets() throws {
        let characterFilter = CharacterFilter()
        
        characterFilter.setName(name: "rick")
        characterFilter.setPage(page: "1")
        characterFilter.setStatus(status: "alive")
        
        XCTAssertEqual(characterFilter.getName(), "rick")
        XCTAssertEqual(characterFilter.getPage(), "1")
        XCTAssertEqual(characterFilter.getStatus(), "alive")
    }
    
    func testEquality() throws {
        let characterFilter1 = CharacterFilter()
        
        characterFilter1.setName(name: "rick")
        characterFilter1.setPage(page: "1")
        characterFilter1.setStatus(status: "alive")
        
        let characterFilter2 = CharacterFilter()
        
        characterFilter2.setName(name: "rick")
        characterFilter2.setPage(page: "1")
        characterFilter2.setStatus(status: "alive")
        
        XCTAssertTrue(characterFilter1 == characterFilter2)
    }
}
