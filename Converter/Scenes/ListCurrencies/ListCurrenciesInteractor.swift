//
//  ListCurrenciesInteractor.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class ListCurrenciesInteractor: ListCurrenciesBusinessLogic {
    // MARK: VIP Variables
    var presenter: ListCurrenciesPresentationLogic?
    var currencyWorker = CurrencyWorker(currencyStore: CurrencyMemoryStore())
    
    // MARK: Business Logic
    func fetchCurrencies() {
        currencyWorker.fetchCurrencies { result in
            switch result {
            case .success(let currencies):
                let response = ListCurrencies.FetchCurrencies.Response(currencies: currencies)
                self.presenter?.presentFetchedCurrencies(response: response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
