//
//  Currency.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

struct Currency: Hashable, Equatable {
    var name: String
    var symbol: String
}

struct SupportedCurrencies: Codable {
    let currencies: [String: String]
}
