//
//  ListCurrenciesProtocols.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

protocol ListCurrenciesBusinessLogic {
    func fetchCurrencies()
}

protocol ListCurrenciesPresentationLogic {
    func presentFetchedCurrencies(response: ListCurrencies.FetchCurrencies.Response)
}

protocol ListCurrenciesDisplayLogic: class {
    func displayFetchedCurrencies(viewModel: ListCurrencies.FetchCurrencies.ViewModel)
}
