//
//  CurrencyApiStore.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class CurrencyApiStore: CurrencyStoreProtocol {
    
    func fetchCurrencies(completion: @escaping (Result<[Currency], BtgNetworkError>) -> Void) {
        let endpoint = UrlStubs.base.rawValue + UrlStubs.list.rawValue + AccessKey.API.rawValue
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let currenciesList = try decoder.decode(SupportedCurrencies.self, from: data)
                var currencies = [Currency]()
                for currency in currenciesList.currencies {
                    currencies.append(Currency(name: currency.value, symbol: currency.key))
                }
                completion(.success(currencies))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
