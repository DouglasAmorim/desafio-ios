//
//  CharacterResponseTests.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import desafio_ios

final class CharacterResponseTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testDecodeData() throws {
        
        let informationResponse = InformationResponse()
        informationResponse.setItemAmount(itemAmount: 666)
        informationResponse.setPageAmount(pageAmount: 66)
        informationResponse.setUrlNextPage(nextPage: "https://next")
        informationResponse.setUrlPreviousPage(prevPage: "http://prev")
        
        let location = BrieflyLocationResponse()
        location.setName(name: "name")
        location.setUrl(url: "url")
        
        let characterInfoResponse = CharacterInfoResponse()
        characterInfoResponse.setId(id: 1)
        characterInfoResponse.setUrl(url: "url")
        characterInfoResponse.setName(name: "rick")
        characterInfoResponse.setType(type: "Water")
        characterInfoResponse.setImage(image: "image.jpeg")
        characterInfoResponse.setGender(gender: "Male")
        characterInfoResponse.setOrigin(origin: location)
        characterInfoResponse.setLocation(location: location)
        characterInfoResponse.setStatus(status: "alive")
        characterInfoResponse.setSpecies(species: "Human")
        characterInfoResponse.setCreated(created: "2023-07-24")
        characterInfoResponse.setEpisode(episodes: ["teste"])
        
        let dictionary: [String: Any] = ["info": ["count": 666,
                                                  "pages": 66,
                                                  "next": "https://next",
                                                  "prev": "http://prev"] as [String : Any],
                                         "results": [
                                            ["id": 1,
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
                                             "created": "2023-07-24"] as [String : Any]
                                         ]]
            
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            let characterFilter = try JSONDecoder().decode(CharacterResponse.self, from: data)
            
            XCTAssertEqual(characterFilter.getCharacterList(), [characterInfoResponse])
            XCTAssertEqual(characterFilter.getInformationResponse(), informationResponse)
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCharacter_GetsAndSets() throws {
        let informationResponse = InformationResponse()
        informationResponse.setItemAmount(itemAmount: 666)
        informationResponse.setPageAmount(pageAmount: 66)
        informationResponse.setUrlNextPage(nextPage: "https://next")
        informationResponse.setUrlPreviousPage(prevPage: "http://prev")
        
        let location = BrieflyLocationResponse()
        location.setName(name: "name")
        location.setUrl(url: "url")
        
        let characterInfoResponse = CharacterInfoResponse()
        characterInfoResponse.setId(id: 1)
        characterInfoResponse.setUrl(url: "url")
        characterInfoResponse.setName(name: "rick")
        characterInfoResponse.setType(type: "Water")
        characterInfoResponse.setImage(image: "image.jpeg")
        characterInfoResponse.setGender(gender: "Male")
        characterInfoResponse.setOrigin(origin: location)
        characterInfoResponse.setLocation(location: location)
        characterInfoResponse.setStatus(status: "alive")
        characterInfoResponse.setSpecies(species: "Human")
        characterInfoResponse.setCreated(created: "2023-07-24")
        characterInfoResponse.setEpisode(episodes: ["teste"])
        
        let characterResponse = CharacterResponse()
        characterResponse.setCharacterList(characterList: [characterInfoResponse])
        characterResponse.setInformationResponse(informationResponse: informationResponse)
        
        XCTAssertEqual(characterResponse.getCharacterList(), [characterInfoResponse])
        XCTAssertEqual(characterResponse.getInformationResponse(), informationResponse)
    }

    func testEquality() throws {
        let informationResponse = InformationResponse()
        informationResponse.setItemAmount(itemAmount: 666)
        informationResponse.setPageAmount(pageAmount: 66)
        informationResponse.setUrlNextPage(nextPage: "https://next")
        informationResponse.setUrlPreviousPage(prevPage: "http://prev")
        
        let location = BrieflyLocationResponse()
        location.setName(name: "name")
        location.setUrl(url: "url")
        
        let characterInfoResponse = CharacterInfoResponse()
        characterInfoResponse.setId(id: 1)
        characterInfoResponse.setUrl(url: "url")
        characterInfoResponse.setName(name: "rick")
        characterInfoResponse.setType(type: "Water")
        characterInfoResponse.setImage(image: "image.jpeg")
        characterInfoResponse.setGender(gender: "Male")
        characterInfoResponse.setOrigin(origin: location)
        characterInfoResponse.setLocation(location: location)
        characterInfoResponse.setStatus(status: "alive")
        characterInfoResponse.setSpecies(species: "Human")
        characterInfoResponse.setCreated(created: "2023-07-24")
        characterInfoResponse.setEpisode(episodes: ["teste"])
        
        let characterResponse1 = CharacterResponse()
        characterResponse1.setCharacterList(characterList: [characterInfoResponse])
        characterResponse1.setInformationResponse(informationResponse: informationResponse)
        
        let characterResponse2 = CharacterResponse()
        characterResponse2.setCharacterList(characterList: [characterInfoResponse])
        characterResponse2.setInformationResponse(informationResponse: informationResponse)
        
        XCTAssertTrue(characterResponse1 == characterResponse2)
    }
}
