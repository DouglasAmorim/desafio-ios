//
//  CharacterInfoResponseTest.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import desafio_ios

final class CharacterInfoResponseTest: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testDecodedData() {
        let location = BrieflyLocationResponse()
        location.setName(name: "name")
        location.setUrl(url: "url")
        
        let dictionary: [String: Any] = ["id": 1,
                                         "name": "rick",
                                         "status": "alive",
                                         "species": "Human",
                                         "type": "Water",
                                         "gender": "Male",
                                         "origin": ["name": "name", "url": "url"],
                                         "location": ["name": "name", "url": "url"],
                                         "image": "image.jpeg",
                                         "episode": ["teste"],
                                         "url": "url",
                                         "created": "2023-07-24"]
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            let characterFilter = try JSONDecoder().decode(CharacterInfoResponse.self, from: data)
            
            XCTAssertEqual(characterFilter.getId(), 1)
            XCTAssertEqual(characterFilter.getName(), "rick")
            XCTAssertEqual(characterFilter.getStatus(), "alive")
            XCTAssertEqual(characterFilter.getSpecies(), "Human")
            XCTAssertEqual(characterFilter.getType(), "Water")
            XCTAssertEqual(characterFilter.getGender(), "Male")
            XCTAssertEqual(characterFilter.getOrigin(), location)
            XCTAssertEqual(characterFilter.getLocation(), location)
            XCTAssertEqual(characterFilter.getImage(), "image.jpeg")
            XCTAssertEqual(characterFilter.getEpisode(), ["teste"])
            XCTAssertEqual(characterFilter.getCreated(), "2023-07-24")
            XCTAssertEqual(characterFilter.getUrl(), "url")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testCharacterInfo_GetsAndSets() throws {
        let location = BrieflyLocationResponse()
        location.setName(name: "name")
        location.setUrl(url: "url")
        
        let characterInfoResponse = CharacterInfoResponse()
        characterInfoResponse.setId(id: 1)
        characterInfoResponse.setUrl(url: "url")
        characterInfoResponse.setName(name: "name")
        characterInfoResponse.setType(type: "type")
        characterInfoResponse.setImage(image: "image")
        characterInfoResponse.setGender(gender: "gender")
        characterInfoResponse.setOrigin(origin: location)
        characterInfoResponse.setLocation(location: location)
        characterInfoResponse.setStatus(status: "status")
        characterInfoResponse.setSpecies(species: "species")
        characterInfoResponse.setCreated(created: "created")
        
        XCTAssertEqual(characterInfoResponse.getId(), 1)
        XCTAssertEqual(characterInfoResponse.getUrl(), "url")
        XCTAssertEqual(characterInfoResponse.getName(), "name")
        XCTAssertEqual(characterInfoResponse.getType(), "type")
        XCTAssertEqual(characterInfoResponse.getImage(), "image")
        XCTAssertEqual(characterInfoResponse.getGender(), "gender")
        XCTAssertEqual(characterInfoResponse.getOrigin(), location)
        XCTAssertEqual(characterInfoResponse.getLocation(), location)
        XCTAssertEqual(characterInfoResponse.getStatus(), "status")
        XCTAssertEqual(characterInfoResponse.getSpecies(), "species")
        XCTAssertEqual(characterInfoResponse.getCreated(), "created")
    }
    
    func testEquality() throws {
        let location = BrieflyLocationResponse()
        location.setName(name: "name")
        location.setUrl(url: "url")
        
        let characterInfoResponse1 = CharacterInfoResponse()
        characterInfoResponse1.setId(id: 1)
        characterInfoResponse1.setUrl(url: "url")
        characterInfoResponse1.setName(name: "name")
        characterInfoResponse1.setType(type: "type")
        characterInfoResponse1.setImage(image: "image")
        characterInfoResponse1.setGender(gender: "gender")
        characterInfoResponse1.setOrigin(origin: location)
        characterInfoResponse1.setLocation(location: location)
        characterInfoResponse1.setStatus(status: "status")
        characterInfoResponse1.setSpecies(species: "species")
        characterInfoResponse1.setCreated(created: "created")
        
        let characterInfoResponse2 = CharacterInfoResponse()
        characterInfoResponse2.setId(id: 1)
        characterInfoResponse2.setUrl(url: "url")
        characterInfoResponse2.setName(name: "name")
        characterInfoResponse2.setType(type: "type")
        characterInfoResponse2.setImage(image: "image")
        characterInfoResponse2.setGender(gender: "gender")
        characterInfoResponse2.setOrigin(origin: location)
        characterInfoResponse2.setLocation(location: location)
        characterInfoResponse2.setStatus(status: "status")
        characterInfoResponse2.setSpecies(species: "species")
        characterInfoResponse2.setCreated(created: "created")
        
        XCTAssertTrue(characterInfoResponse1 == characterInfoResponse2)
    }
}
