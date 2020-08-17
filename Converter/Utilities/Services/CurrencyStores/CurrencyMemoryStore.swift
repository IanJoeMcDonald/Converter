//
//  CurrencyMemoryStore.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class CurrencyMemoryStore: CurrencyStoreProtocol {
    static var currencies = [
        Currency(name:"Argentine Peso", symbol:"ARS"),
        Currency(name:"Bosnia-Herzegovina Convertible Mark", symbol:"BAM"),
        Currency(name:"Costa Rican Colón", symbol:"CRC"),
        Currency(name:"Algerian Dinar", symbol:"DZD"),
        Currency(name:"Euro", symbol:"EUR"),
        Currency(name:"Fijian Dollar", symbol:"FJD"),
        Currency(name:"British Pound Sterling", symbol:"GBP"),
        Currency(name:"Croatian Kuna", symbol:"HRK"),
        Currency(name:"Icelandic Króna", symbol:"ISK"),
        Currency(name:"Japanese Yen", symbol:"JPY"),
        Currency(name:"Kenyan Shilling", symbol:"KES"),
        Currency(name:"Libyan Dinar", symbol:"LYD"),
        Currency(name:"Moroccan Dirham", symbol:"MAD"),
        Currency(name:"Nicaraguan Córdoba", symbol:"NIO"),
        Currency(name:"Omani Rial", symbol:"OMR"),
        Currency(name:"Peruvian Nuevo Sol", symbol:"PEN"),
        Currency(name:"Qatari Rial", symbol:"QAR"),
        Currency(name:"Russian Ruble", symbol:"RUB"),
        Currency(name:"São Tomé and Príncipe Dobra", symbol:"STD"),
        Currency(name:"Tongan paʻanga", symbol:"TOP"),
        Currency(name:"United States Dollar", symbol:"USD"),
        Currency(name:"Venezuelan Bolívar Fuerte", symbol:"VEF"),
        Currency(name:"Samoan Tala", symbol:"WST"),
        Currency(name:"Gold (troy ou nce)", symbol:"XAU"),
        Currency(name:"Yemeni Rial", symbol:"YER"),
        Currency(name:"South African Rand", symbol:"ZAR")]
    
    func fetchCurrencies(completion: @escaping (Result<[Currency], BtgNetworkError>) -> Void) {
        completion(.success(CurrencyMemoryStore.currencies))
    }
}
