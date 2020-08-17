//
//  ConvertCurrenciesPresenterTests.swift
//  ConverterTests
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import XCTest
@testable import Converter

class ConvertCurrenciesPresenterTests: XCTestCase {
    // MARK: System under test
    var sut: ConvertCurrenciesPresenter!

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
        sut = ConvertCurrenciesPresenter()
    }
    
    // MARK: Test Doubles
    class ConvertCurrenciesDisplayLogicSpy: ConvertCurrenciesDisplayLogic {
        var displayFetchedConversionCalled = false
        var displayConversionErrorCalled = false
        
        func displayFetchedConversion(viewModel: ConvertCurrencies.FetchConversion.ViewModel) {
            displayFetchedConversionCalled = true
        }
        
        func displayConversionError(viewModel: ConvertCurrencies.FetchConversion.ErrorViewModel) {
            displayConversionErrorCalled = true
        }
    }
    
    // MARK: Presnetation tests
    
    func testPresentFetechedConversionShouldAskViewControlerToDisplayResults() {
        // Given
        let spy = ConvertCurrenciesDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        let response = ConvertCurrencies.FetchConversion.Response(convertedValue: 1.23)
        sut.presentFetchedConversion(response: response)
        
        // Then
        XCTAssert(spy.displayFetchedConversionCalled)
    }

}
