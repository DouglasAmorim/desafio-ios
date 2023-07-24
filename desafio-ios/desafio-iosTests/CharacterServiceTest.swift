//
//  CharacterServiceTest.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import Pods_desafio_ios
@testable import desafio_ios

import Alamofire
import Mocker

final class CharacterServiceTest: XCTestCase {
    private var configuration = URLSessionConfiguration.default
    private var session: Session = Session()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        self.configuration.protocolClasses = [MockingURLProtocol.self] + (self.configuration.protocolClasses ?? [])
        self.session = Session(configuration: self.configuration, delegate: Session.default.delegate)
    }

    override func tearDownWithError() throws { }
    
    func testGetCharacterList() throws {
        guard let apiEndpoint = URL(string: Endpoints.character) else {
            XCTFail()
            return
        }
        
        /// Setup Mock Response
        ///
        let mockInformationResponse = InformationResponse()
        mockInformationResponse.setItemAmount(itemAmount: 66)
        mockInformationResponse.setPageAmount(pageAmount: 6)
        mockInformationResponse.setUrlNextPage(nextPage: "https://umaapi.api.test")
        mockInformationResponse.setUrlPreviousPage(prevPage: nil)
        
        let location = BrieflyLocationResponse()
        location.setName(name: "Name")
        location.setUrl(url: "https://location.url")
        
        let characterInfo = CharacterInfoResponse()
        characterInfo.setId(id: 666)
        characterInfo.setUrl(url: "https://character.url")
        characterInfo.setName(name: "Name")
        characterInfo.setType(type: "FIRE")
        characterInfo.setImage(image: "https://character.image.jpeg")
        characterInfo.setGender(gender: "Gender")
        characterInfo.setOrigin(origin: location)
        characterInfo.setLocation(location: location)
        characterInfo.setCreated(created: "Created")
        characterInfo.setSpecies(species: "Species")
        characterInfo.setEpisode(episodes: ["Episodes"])
        
        let mockCharacterResonse = CharacterResponse()
        mockCharacterResonse.setCharacterList(characterList: [characterInfo])
        mockCharacterResonse.setInformationResponse(informationResponse: mockInformationResponse)
        
        let requestExpectation = expectation(description: "Request should finish")
        
        /// Register Mock
        ///
        
        guard let mockedData = try? JSONEncoder().encode(mockCharacterResonse) else {
            XCTFail()
            return
        }
        
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()
        
        session.request(apiEndpoint, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .handleResponse({ response in
                switch response {
                case .success(let data):
                    if let characterResponse = try? JSONDecoder().decode(CharacterResponse.self, from: data) {
                        XCTAssertEqual(mockCharacterResonse, characterResponse)
                        requestExpectation.fulfill()
                    } else {
                        XCTFail()
                    }
                        
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            })
            .resume()
        
        wait(for: [requestExpectation], timeout: 120)
        
    }
}
