//
//  BtgNetworkError.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

enum BtgNetworkError: String, Error {
    case invalidURL = "An invalid request was created. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}

enum BtgConversionError: String, Error {
    case sourceNil = "The source currency cannot be nil"
    case destinationNil = "The target currency cannot be nil"
    case sourceInvalid = "The source currency is invalid"
    case destinationInvalid = "The target currency is invalid"
    case valueNil = "The value to be converted cannot be nil"
    case valueInvalid = "The value to be converted must be a number"
    case conversionError = "Unable to convert the value at this time"
}
