//
//  ConverterMemoryStore.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

class ConverterMemoryStore: ConverterStoreProtocol {
    
    static var conversionList = [
        "USDARS":73100697,
        "USDBAM":165042,
        "USDCRC":59488629,
        "USDDZD":12829474,
        "USDEUR":0.843165,
        "USDFJD":2124983,
        "USDGBP":0.763665,
        "USDHRK":634813,
        "USDISK":136060269,
        "USDJPY":106017984,
        "USDKES":108296045,
        "USDLYD":1374977,
        "USDMAD":9190028,
        "USDNIO":34550061,
        "USDOMR":0.384996,
        "USDPEN":3579498,
        "USDQAR":364104,
        "USDRUB":73420802,
        "USDSTD":21292767074,
        "USDTOP":228605,
        "USDUSD":1,
        "USDVEF":9987497,
        "USDWST":2636426,
        "USDXAU":0.000503,
        "USDYER":250349966,
        "USDZAR":1749555]
    
    func fetchConversion(source: String, destination: String, value: String,
                         completion: @escaping (Result<Double, BtgConversionError>) -> Void) {
        if let currenciesError = verifyCurrencies(source: source, destination: destination) {
            completion(.failure(currenciesError))
        }
        
        var conversionValue: Double = 0
        switch verifyValue(value: value) {
        case .success(let value):
            conversionValue = value
        case .failure(let error):
            completion(.failure(error))
        }
        
        if source == BaseCurrency.base.rawValue {
            guard let resultValue = convertFromBase(to: destination, amount: conversionValue) else {
                completion(.failure(.conversionError))
                return
            }
            completion(.success(resultValue))
            
        } else if destination == BaseCurrency.base.rawValue {
            guard let resultValue = convertToBase(currency: source, amount: conversionValue) else {
                completion(.failure(.conversionError))
                return
            }
            completion(.success(resultValue))
            
        } else {
            guard let convertBase = convertToBase(currency: source, amount: conversionValue) else {
                completion(.failure(.conversionError))
                return
            }
            
            guard let resultValue = convertFromBase(to: destination, amount: convertBase) else {
                completion(.failure(.conversionError))
                return
            }
            completion(.success(resultValue))
        }
    }
    
    private func verifyCurrencies(source: String, destination: String) -> BtgConversionError? {
        guard source.count == 3 else {
            return(.sourceInvalid)
        }
        
        guard destination.count == 3 else {
            return(.destinationInvalid)
        }
        
        return(nil)
    }
    
    private func verifyValue(value: String) -> Result<Double, BtgConversionError> {
        guard let valueDouble = Double(value) else {
            return(.failure(.valueInvalid))
        }
        
        return(.success(valueDouble))
    }
    
    private func convertFromBase(to currency: String, amount: Double) -> Double? {
        let conversionString = BaseCurrency.base.rawValue + currency
        guard let conversionRate = ConverterMemoryStore.conversionList[conversionString] else {
            return nil
        }
        
        return conversionRate * amount
    }
    
    private func convertToBase(currency: String, amount: Double) -> Double? {
        let conversionString = BaseCurrency.base.rawValue + currency
        guard let conversionRate = ConverterMemoryStore.conversionList[conversionString] else {
            return nil
        }
        
        return 1/conversionRate * amount
    }
}
