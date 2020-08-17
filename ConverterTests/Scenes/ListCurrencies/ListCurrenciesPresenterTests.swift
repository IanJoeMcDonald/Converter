//
//  ListCurrenciesPresenterTests.swift
//  ConverterTests
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import XCTest
@testable import Converter

class ListCurrenciesPresenterTests: XCTestCase {
    // MARK: System under test
    var sut: ListCurrenciesPresenter!
    
    
    // MARK: Test Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        setupPresenter()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    // MARK: Test Setup
    func setupPresenter() {
        sut = ListCurrenciesPresenter()
    }
    
    // MARK: Test Doubles
    class ListCurrenciesDisplayLogicSpy: ListCurrenciesDisplayLogic {
        var displayFetchedCurrenciesCalled = false
        
        func displayFetchedCurrencies(viewModel: ListCurrencies.FetchCurrencies.ViewModel) {
            displayFetchedCurrenciesCalled = true
        }
    }
    
    // MARK: Presentation Tests
    func testPresentFecthedCurrenciesShouldAskViewControlerToDisplayResults() {
        // Given
        let spy = ListCurrenciesDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        let response = ListCurrencies.FetchCurrencies.Response(currencies: [])
        sut.presentFetchedCurrencies(response: response)
        
        // Then
        XCTAssert(spy.displayFetchedCurrenciesCalled)
    }
}
