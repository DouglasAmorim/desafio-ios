//
//  CharacterFilterViewModel.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation

protocol CharacterFilterViewModelProtocol: AnyObject {
    func getCharacterFilterList(page: Int, name: String, status: String, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void)
}

class CharacterFilterViewModel: CharacterFilterViewModelProtocol {
    private var characterService: CharacterService
    
    // MARK: Initializers
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func getCharacterFilterList(page: Int, name: String, status: String, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        
    }
}
