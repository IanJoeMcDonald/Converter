//
//  ListCurrenciesInteractorTests.swift
//  ConverterTests
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import XCTest
@testable import Converter

class ListCurrenciesInteractorTests: XCTestCase {

    // MARK: System under test
    var sut: ListCurrenciesInteractor!
    
    
    // MARK: Test Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        setupInteractor()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    // MARK: Test Setup
    func setupInteractor() {
        sut = ListCurrenciesInteractor()
    }
    
    // MARK: Test Doubles
    class ListCurrenciesPresentationLogicSpy: ListCurrenciesPresentationLogic {
        var presentFetchedCurrenciesCalled = false
        
        func presentFetchedCurrencies(response: ListCurrencies.FetchCurrencies.Response) {
            presentFetchedCurrenciesCalled = true
        }
    }
    
    class CurrencyWorkerSpy: CurrencyWorker {
        var fetchCurrenciesCalled = false
        
        override func fetchCurrencies(completion: @escaping (Result<[Currency], BtgNetworkError>) -> Void) {
            fetchCurrenciesCalled = true
            completion(.success([]))
        }
    }
    
    // MARK: Presentation Tests
    func testFetchCurrenciesShouldAskPresenterToFormatResults() {
        // Given
        let spy = ListCurrenciesPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.fetchCurrencies()
        
        // Then
        XCTAssert(spy.presentFetchedCurrenciesCalled)
    }
    
    func testFetchCurrenciesShouldAskCurrencyWorkerToFetchCurrencies() {
        // Given
        let spy = CurrencyWorkerSpy(currencyStore: CurrencyMemoryStore())
        sut.currencyWorker = spy
        
        // When
        sut.fetchCurrencies()
        
        // Then
        XCTAssert(spy.fetchCurrenciesCalled)
    }
}
