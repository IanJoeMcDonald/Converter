//
//  ListCurrenciesPresenter.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class ListCurrenciesPresenter: ListCurrenciesPresentationLogic {
    // MARK: VIP Variables
    weak var viewController: ListCurrenciesDisplayLogic?
    
    
    // MARK: Presentation Logic
    func presentFetchedCurrencies(response: ListCurrencies.FetchCurrencies.Response) {
        let currencies = response.currencies.sorted { $0.name.lowercased() < $1.name.lowercased()}
        let viewModel = ListCurrencies.FetchCurrencies.ViewModel(currencies: currencies)
        viewController?.displayFetchedCurrencies(viewModel: viewModel)
    }
}
