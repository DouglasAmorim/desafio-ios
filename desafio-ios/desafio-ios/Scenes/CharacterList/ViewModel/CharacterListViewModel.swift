//
//  CharacterListViewModel.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

protocol CharacterListViewModelProtocol: AnyObject {
    func getCharacterList(page: Int, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void)
}

class CharacterListViewModel: CharacterListViewModelProtocol {
    private var characterService: CharacterService
    
    // MARK: Initializers
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func getCharacterList(page: Int = 1, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        
        self.characterService.getCharacterList(page: String(page), { response in
            switch response {
            case .success(let characterResponse):
                result(.success(characterResponse))
                
            case .failure(let errorCustom):
                break
            }
        })
    }
}
