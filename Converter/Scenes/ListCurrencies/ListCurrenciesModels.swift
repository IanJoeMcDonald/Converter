//
//  ListCurrenciesModels.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation


enum ListCurrencies {
    
    enum FetchCurrencies {
        struct Response {
            var currencies: [Currency]
        }
        
        struct ViewModel {
            var currencies: [Currency]
        }
    }
}
