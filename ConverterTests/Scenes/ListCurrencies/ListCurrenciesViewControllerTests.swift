//
//  ListCurrenciesViewControllerTests.swift
//  ConverterTests
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import XCTest
@testable import Converter

class ListCurrenciesViewControllerTests: XCTestCase {

    // MARK: System Under Test
    var sut: ListCurrenciesViewController!
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
        sut = storyboard.instantiateViewController(withIdentifier: "ListCurrenciesViewController") as? ListCurrenciesViewController
    }
    
    func loadView()
    {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    // MARK: Test Doubles
    class ListCurrenciesBusinessLogicSpy: ListCurrenciesBusinessLogic {
        var fetchCurrenciesCalled = false
        
        func fetchCurrencies() {
            fetchCurrenciesCalled = true
        }
    }
    
    class TableViewSpy: UITableView {
        var reloadDataCalled = false
        
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    // MARK: Business Logic Tests
    func testShouldFetchCurrenciesWhenViewDidAppear() {
        // Given
        let spy = ListCurrenciesBusinessLogicSpy()
        sut.interactor = spy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        
        // Then
        XCTAssert(spy.fetchCurrenciesCalled)
    }
    
    func testShouldDisplayFetchedCurrencies() {
        // Given
        let spy = TableViewSpy()
        sut.tableView = spy
        
        // When
        let displayedCurrencies = [Currency(name: "United States Dollar", symbol: "USD")]
        let viewModel = ListCurrencies.FetchCurrencies.ViewModel(currencies: displayedCurrencies)
        sut.displayFetchedCurrencies(viewModel: viewModel)
        
        // Then
        XCTAssert(spy.reloadDataCalled)
    }
    
    // MARK: Tableview Tests
    func testNumberOfRowsInAnySectionShouldEqaulNumberOfCurrenciesToDisplay()
    {
        // Given
        loadView()
        let tableView = sut.tableView
        let displayedCurrencies = [Currency(name: "United States Dollar", symbol: "USD")]
        sut.displayedCurrencies = displayedCurrencies
        
        // When
        let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, displayedCurrencies.count)
    }
    
    func testShouldConfigureTableViewCellToDisplayOrder()
    {
        // Given
        loadView()
        let tableView = sut.tableView
        let displayedCurrencies = [Currency(name: "United States Dollar", symbol: "USD")]
        sut.displayedCurrencies = displayedCurrencies
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView!, cellForRowAt: indexPath)
        
        // Then
        XCTAssertEqual(cell.textLabel?.text, "United States Dollar")
        XCTAssertEqual(cell.detailTextLabel?.text, "USD")
    }
}

