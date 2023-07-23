//
//  CharacterService.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import Alamofire

class CharacterService {
    func getCharacterList(page: String? = nil, _ result: @escaping (Result<CharacterResponse, ErrorCustom>) -> Void) {
        var parameter: [String: Any]? = nil
        
        if let page = page {
            parameter = [
                "page": page
            ]
        }
        
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
    }
}