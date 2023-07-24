//
//  CharacterFilterViewModel.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation

protocol CharacterFilterViewModelProtocol: AnyObject {
    var loading: Observable<Bool> { get }
    func getCharacterFilterList(characterFilter: CharacterFilter, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void)
}

class CharacterFilterViewModel: CharacterFilterViewModelProtocol {
    // MARK: Private Attributes
    private var characterService: CharacterService
    
    // MARK: Public Attributes
    public let loading: Observable<Bool> = Observable(false)
    
    // MARK: Initializers
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func getCharacterFilterList(characterFilter: CharacterFilter, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        self.loading.value = true
        self.characterService.getCharacterList(characterFilter: characterFilter, { response in
            self.loading.value = false
            result(response)
        })
    }
}
