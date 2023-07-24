//
//  Observable.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 24/07/23.
//

import Foundation

final class Observable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ object: T) {
        value = object
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
