//
//  ConvertCurrenciesViewControllerTests.swift
//  ConverterTests
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import XCTest
@testable import Converter

class ConvertCurrenciesViewControllerTests: XCTestCase {
    // MARK: System Under Test
    var sut: ConvertCurrenciesViewController!
    var window: UIWindow!
    
    // MARK: Test Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        window = UIWindow()
        setupViewController()
    }

    override func tearDownWithError() throws {
        window = nil
        try super.tearDownWithError()
    }
    
    // MARK: Test Setup
    func setupViewController()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        sut = storyboard.instantiateViewController(withIdentifier: "ConvertCurrenciesViewController") as? ConvertCurrenciesViewController
    }
    
    func loadView()
    {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    // MARK: Test Doubles
    class ConvertCurrenciesBusinessLogicSpy: ConvertCurrenciesBusinessLogic {
        var fetchConversionCalled = false
        
        func fetchConversion(request: ConvertCurrencies.FetchConversion.Request) {
            fetchConversionCalled = true
        }
    }
    
    // MARK: Business Logic Test
    func testShouldFetchConversionWhenBaseConverterViewRequests() {
        let spy = ConvertCurrenciesBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        sut.viewDidAppear(true)
        
        // When
        let baseConverterView = sut.baseConverterView!
        let targetConverterView = sut.targetConverterView!
        baseConverterView.selectedCurrency = Currency(name:"United States Dollar", symbol:"USD")
        baseConverterView.conversionValue = "1.23"
        targetConverterView.selectedCurrency = Currency(name:"Euro", symbol:"EUR")
        sut.baseConverterView.delegate?.requestConversion(baseConverterView)
        
        // Then
        XCTAssert(spy.fetchConversionCalled)
    }

    func testShouldFetchConversionWhenTargetConverterViewRequests() {
        let spy = ConvertCurrenciesBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        sut.viewDidAppear(true)
        
        // When
        let baseConverterView = sut.baseConverterView!
        let targetConverterView = sut.targetConverterView!
        baseConverterView.selectedCurrency = Currency(name:"United States Dollar", symbol:"USD")
        targetConverterView.selectedCurrency = Currency(name:"Euro", symbol:"EUR")
        targetConverterView.conversionValue = "1.23"
        sut.targetConverterView.delegate?.requestConversion(targetConverterView)
        
        // Then
        XCTAssert(spy.fetchConversionCalled)
    }
}
