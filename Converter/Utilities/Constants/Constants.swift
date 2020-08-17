//
//  Constants.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

enum UrlStubs: String {
    case base = "http://api.currencyLayer.com/"
    case list = "list?access_key="
    case live = "live?access_key="
}

enum AccessKey: String {
    case API = "d723abc7df7149aac552c7dccaab6337"
}

enum Colors: String {
    case accent = "Accent"
    case background = "Background"
    case highlight = "Highlight"
    case label = "Label"
    case main = "Main"
    case secondaryLabel = "SecondaryLabel"
}

enum PlaceholderText: String {
    case textField = "Enter a value"
    case initialValue = "1.00"
    case searchBar = "Search for a currency"
}

enum ButtonTitles: String {
    case selectCurrency = "Select a currency"
}

enum LabelTitles: String {
    case baseCurrency = "From"
    case targetCurrency = "To"
}

enum BaseCurrency: String {
    case base = "USD"
}

enum AlertController: String {
    case errorTitle = "An Error has occured"
    case okButton = "OK"
    case orderTitle = "Select Display Order"
    case byName = "By name"
    case bySymbol = "By symbol"
    case cancelButton = "Cancel"
    case mustContainNumbers = "The value field may only contain numbers"
}
