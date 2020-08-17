//
//  ConvertCurrenciesPresenter.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class ConvertCurrenciesPresenter: ConvertCurrenciesPresentationLogic {
    // MARK: VIP Variables
    weak var viewController: ConvertCurrenciesDisplayLogic?
    
    func presentFetchedConversion(response: ConvertCurrencies.FetchConversion.Response) {
        let convertedValue = String(response.convertedValue)
        let viewModel = ConvertCurrencies.FetchConversion.ViewModel(convertedValue: convertedValue)
        viewController?.displayFetchedConversion(viewModel: viewModel)
    }
    
    func presentConversionError(response: ConvertCurrencies.FetchConversion.Error) {
        let errorText = response.errorText
        let viewModel = ConvertCurrencies.FetchConversion.ErrorViewModel(errorText: errorText)
        viewController?.displayConversionError(viewModel: viewModel)
    }
}
