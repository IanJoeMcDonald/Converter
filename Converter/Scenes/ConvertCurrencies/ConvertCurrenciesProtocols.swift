//
//  ConvertCurrenciesProtocols.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

protocol ConvertCurrenciesBusinessLogic {
    func fetchConversion(request: ConvertCurrencies.FetchConversion.Request)
}

protocol ConvertCurrenciesPresentationLogic {
    func presentFetchedConversion(response: ConvertCurrencies.FetchConversion.Response)
    func presentConversionError(response: ConvertCurrencies.FetchConversion.Error)
}

protocol ConvertCurrenciesDisplayLogic: class {
    func displayFetchedConversion(viewModel: ConvertCurrencies.FetchConversion.ViewModel)
    func displayConversionError(viewModel: ConvertCurrencies.FetchConversion.ErrorViewModel)
}
