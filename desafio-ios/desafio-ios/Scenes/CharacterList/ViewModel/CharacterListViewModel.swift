//
//  CharacterListViewModel.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

protocol CharacterListViewModelProtocol: AnyObject {
    var loading: Observable<Bool> { get }
    func getCharacterList(characterFilter: CharacterFilter, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void)
}

class CharacterListViewModel: CharacterListViewModelProtocol {
    // MARK: Private Attributes
    private var characterService: CharacterService
    
    // MARK: Public Attributes
    public let loading: Observable<Bool> = Observable(false)
    
    // MARK: Initializers
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func getCharacterList(characterFilter: CharacterFilter = CharacterFilter(), _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        self.loading.value = true
        self.characterService.getCharacterList(characterFilter: characterFilter, { response in
            self.loading.value = false
            result(response)
        })
    }
}
