//
//  CharacterService.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import Alamofire

class CharacterService {
    func getCharacterList(characterFilter: CharacterFilter = CharacterFilter(), _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        
        do {
            let parameterData = try JSONEncoder().encode(characterFilter)
            let parameter = try JSONSerialization.jsonObject(with: parameterData, options: []) as? [String: AnyObject]
            
            CustomRequestInterceptor.shared.manager.request(Endpoints.character, parameters: parameter, encoding: URLEncoding.default)
                .handleResponse({ response in
                    
                    switch response {
                    case .success(let data):
                        do {
                            let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                            result(.success(characterResponse))
                            
                        } catch let error {
                            // TODO: Create a code for decode error
                            let errorCustom = ErrorCustom(code: 0, description: error.localizedDescription)
                            result(.failure(errorCustom))
                        }
                        
                        break
                    case .failure(let error):
                        guard let errorCustom = error as? ErrorCustom else {
                            // TODO: Create a code for parse error
                            let errorCustom = ErrorCustom(code: 0, description: error.localizedDescription)
                            result(.failure(errorCustom))
                            return
                        }
                        
                        result(.failure(errorCustom))
                    }
                    
                })
                .resume()
        
        } catch let error {
            guard let errorCustom = error as? ErrorCustom else {
                // TODO: Create a code for parse error
                let errorCustom = ErrorCustom(code: 0, description: error.localizedDescription)
                result(.failure(errorCustom))
                return
            }
            
            result(.failure(errorCustom))
        }
    }
}
