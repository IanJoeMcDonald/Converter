//
//  ConvertCurrenciesInteractorTests.swift
//  ConverterTests
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import XCTest
@testable import Converter

class ConvertCurrenciesInteractorTests: XCTestCase {
    // MARK: System under test
    var sut: ConvertCurrenciesInteractor!
    
    //MARK: Test Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        setupInteractor()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    // MARK: Test Setup
    func setupInteractor() {
        sut = ConvertCurrenciesInteractor()
    }
    
    // MARK: Test Doubles
    class ConvertCurrenciesPresentationLogicSpy: ConvertCurrenciesPresentationLogic {
        var presentFectchedConversionCalled = false
        var presentConversionErrorCalled = false
        
        func presentFetchedConversion(response: ConvertCurrencies.FetchConversion.Response) {
            presentFectchedConversionCalled = true
        }
        
        func presentConversionError(response: ConvertCurrencies.FetchConversion.Error) {
            presentConversionErrorCalled = true
        }
    }
    
    class ConverterWorkerSpy: ConverterWorker {
        var fetchConversionCalled = false
        
        override func fetchConversion(source: String, destination: String, value: String, completion: @escaping (Result<Double, BtgConversionError>) -> Void) {
            fetchConversionCalled = true
            completion(.success(1.23))
        }
    }
    
    // MARK: Presentation Tests
    func testFetchConversionShouldAskPresenterToFormatResults() {
        // Given
        let spy = ConvertCurrenciesPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        let request = ConvertCurrencies.FetchConversion.Request(source: "USD", destination: "EUR", baseValue: "1.23")
        sut.fetchConversion(request: request)
        
        // Then
        XCTAssert(spy.presentFectchedConversionCalled)
    }
    
    func testFetchConversionShouldAskConverterWorkerToFetchConversion() {
        // Given
        let spy = ConverterWorkerSpy(converterStore: ConverterMemoryStore())
        sut.converterWorker = spy
        
        // When
        let request = ConvertCurrencies.FetchConversion.Request(source: "USD", destination: "EUR", baseValue: "1.23")
        sut.fetchConversion(request: request)
        
        // Then
        XCTAssert(spy.fetchConversionCalled)
    }
    
    func testFetchConversionShouldAskToShowErrorWhenInvalidRequest() {
        // Given
        let spy = ConvertCurrenciesPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        let request = ConvertCurrencies.FetchConversion.Request(source: "USD", destination: "EU", baseValue: "1.23")
        sut.fetchConversion(request: request)
        
        // Then
        XCTAssert(spy.presentConversionErrorCalled)
    }

}
