//
//  RequestInterceptor.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import Alamofire

class CustomRequestInterceptor: RequestInterceptor {
    static let TIMEOUT: TimeInterval = 120
    static let shared = CustomRequestInterceptor()
    
    lazy var manager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = CustomRequestInterceptor.TIMEOUT
        
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        let responseCacher = ResponseCacher(behavior: .modify { _ , response in
          let userInfo = ["date": Date()]
            
          return CachedURLResponse(
            response: response.response,
            data: response.data,
            userInfo: userInfo,
            storagePolicy: .allowed)
        })
        
        let manager = Session(configuration: configuration, delegate: Session.default.delegate, interceptor: self, cachedResponseHandler: responseCacher)
        
        return manager
    }()
    
    func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        // Configure Authorization Token IF NEEDED
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Alamofire.Request, for session: Alamofire.Session, dueTo error: Error, completion: @escaping (Alamofire.RetryResult) -> Void) {
        
        // Handle Retry
        completion(.doNotRetry)
    }
}
