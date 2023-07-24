//
//  CharacterResponse.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

class CharacterResponse: Codable, Equatable {
    private var informationResponse: InformationResponse? = nil
    private var characterList: [CharacterInfoResponse]? = nil
    
    enum CodingKeys: String, CodingKey {
        case informationResponse = "info"
        case characterList = "results"
    }
    
    static func == (lhs: CharacterResponse, rhs: CharacterResponse) -> Bool {
        return lhs.informationResponse == rhs.informationResponse &&
        lhs.characterList == rhs.characterList
    }
    
    // MARK: Public Methods
    func getInformationResponse() -> InformationResponse? {
        return informationResponse
    }
    
    func getCharacterList() -> [CharacterInfoResponse]? {
        return characterList
    }
    
    func setInformationResponse(informationResponse: InformationResponse) {
        self.informationResponse = informationResponse
    }
    
    func setCharacterList(characterList: [CharacterInfoResponse]) {
        self.characterList = characterList
    }
}
