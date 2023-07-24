//
//  DataRequestExtension.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import Alamofire

extension DataRequest {
    public func handleResponse(_ completion: @escaping (Result<Data, Error>) -> Void) -> Self {
        return responseData { dataResponse in
             
            // TODO: check if need a specific threatment for each status code
            
            guard let statusCode = dataResponse.response?.statusCode else {
                let erro = ErrorCustom(code: 0, description: "Exception: No Http Status Code")
                completion(.failure(erro))
                return
            }
            
            switch statusCode {
            case HttpStatusCode.successStart.rawValue ... HttpStatusCode.successEnd.rawValue:
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                    
                case .failure(let error):
                    
                    let errorCustom = ErrorCustom(message: error.errorDescription, code: error.responseCode ?? 0, description: error.localizedDescription)
                    
                    completion(.failure(errorCustom))
                }
                
            default:
                // TODO: Decodificar erro
                let errorCustom = ErrorCustom(message: "Exception:", code: 0, description: "Description")
                
                completion(.failure(errorCustom))
            }
            
        }
    }
}
