//
//  ConvertCurrenciesModels.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

enum ConvertCurrencies {
    enum FetchConversion {
        struct Request {
            let source: String
            let destination: String
            let baseValue: String
        }
        
        struct Response {
            let convertedValue: Double
        }
        
        struct Error {
            let errorText: String
        }
        
        struct ViewModel {
            let convertedValue: String
        }
        
        struct ErrorViewModel {
            let errorText: String
        }
    }
}
