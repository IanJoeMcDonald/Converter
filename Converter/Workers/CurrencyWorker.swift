//
//  CurrencyWorker.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class CurrencyWorker {
    var currencyStore: CurrencyStoreProtocol!
    
    init(currencyStore: CurrencyStoreProtocol) {
        self.currencyStore = currencyStore
    }
    
    func fetchCurrencies(completion: @escaping (Result<[Currency], BtgNetworkError>) -> Void) {
        currencyStore.fetchCurrencies { result in
            completion(result)
        }
    }
}


protocol CurrencyStoreProtocol {
    func fetchCurrencies(completion: @escaping (Result<[Currency], BtgNetworkError>) -> Void)
}
