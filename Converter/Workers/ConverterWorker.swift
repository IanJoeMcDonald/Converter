//
//  ConverterWorker.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class ConverterWorker {
    var converterStore: ConverterStoreProtocol!
    
    init(converterStore: ConverterStoreProtocol) {
        self.converterStore = converterStore
    }
    
    func fetchConversion(source: String, destination: String, value: String,
                         completion: @escaping (Result<Double, BtgConversionError>) ->Void) {
        converterStore.fetchConversion(source: source, destination: destination, value: value) {
            result in
            completion(result)
        }
    }
}

protocol ConverterStoreProtocol {
    func fetchConversion(source: String, destination: String, value: String,
                         completion: @escaping (Result<Double, BtgConversionError>) ->Void )
}
