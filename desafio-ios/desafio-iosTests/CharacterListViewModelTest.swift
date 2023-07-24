//
//  CharacterListViewModelTest.swift
//  desafio-iosTests
//
//  Created by Douglas Amorim on 24/07/23.
//

import XCTest
@testable import Pods_desafio_ios
@testable import desafio_ios

final class CharacterListViewModelTest: XCTestCase {
    private var mockCharacterService: MockCharacterService?
    private var viewModel: CharacterListViewModel?
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        self.mockCharacterService = MockCharacterService()
        
        if let mock = self.mockCharacterService {
            self.viewModel = CharacterListViewModel(characterService: mock)
        }
    }

    override func tearDownWithError() throws {
        self.mockCharacterService = nil
        self.viewModel = nil
    }

    func testGetCharacterList() throws {

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
        if let viewModel = viewModel {
            viewModel.getCharacterList({ response in
                switch response {
                case .success(let characterResponse):
                    XCTAssertEqual(viewModel.loading.value, false)
                    XCTAssertEqual(mockCharacterResonse, characterResponse)
                    
                case .failure(let erro):
                    XCTFail(erro.localizedDescription)
                }
            })
        } else {
            XCTFail()
        }
    }
}
