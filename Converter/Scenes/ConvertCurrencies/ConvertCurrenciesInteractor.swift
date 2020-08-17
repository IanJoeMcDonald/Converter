//
//  ConvertCurrenciesInteractor.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class ConvertCurrenciesInteractor: ConvertCurrenciesBusinessLogic {
    // MARK: VIP Variables
    var presenter: ConvertCurrenciesPresentationLogic?
    var converterWorker = ConverterWorker(converterStore: ConverterMemoryStore())
    
    // MARK: Variables
    
    // MARK: Business Logic
    func fetchConversion(request: ConvertCurrencies.FetchConversion.Request) {
        converterWorker.fetchConversion(source: request.source, destination: request.destination,
                                        value: request.baseValue) { [weak self] result in
            switch result {
            case .success(let value):
                let response = ConvertCurrencies.FetchConversion.Response(convertedValue: value)
                self?.presenter?.presentFetchedConversion(response: response)
            case .failure(let error):
                let response = ConvertCurrencies.FetchConversion.Error(errorText: error.rawValue)
                self?.presenter?.presentConversionError(response: response)
            }
        }
    }
}
