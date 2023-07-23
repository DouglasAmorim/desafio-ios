//
//  CharacterFilterViewModel.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation

protocol CharacterFilterViewModelProtocol: AnyObject {
    func getCharacterFilterList(characterFilter: CharacterFilter, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void)
}

class CharacterFilterViewModel: CharacterFilterViewModelProtocol {
    private var characterService: CharacterService
    
    // MARK: Initializers
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func getCharacterFilterList(characterFilter: CharacterFilter, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        self.characterService.getCharacterList(characterFilter: characterFilter, { response in
            result(response)
        })
    }
}
