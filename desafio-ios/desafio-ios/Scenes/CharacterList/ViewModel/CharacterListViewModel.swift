//
//  CharacterListViewModel.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

protocol CharacterListViewModelProtocol: AnyObject {
    func getCharacterList(characterFilter: CharacterFilter, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void)
}

class CharacterListViewModel: CharacterListViewModelProtocol {
    private var characterService: CharacterService
    
    // MARK: Initializers
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func getCharacterList(characterFilter: CharacterFilter = CharacterFilter(), _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        
        self.characterService.getCharacterList(characterFilter: characterFilter, { response in
            result(response)
        })
    }
}
