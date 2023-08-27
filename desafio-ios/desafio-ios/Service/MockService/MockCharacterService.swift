//
//  MockCharacterService.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 24/07/23.
//

import Foundation

class MockCharacterService: CharacterService {
    override func getCharacterList(characterFilter: CharacterFilter = CharacterFilter(), _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        
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
        
        result(.success(mockCharacterResonse))
    }
}
