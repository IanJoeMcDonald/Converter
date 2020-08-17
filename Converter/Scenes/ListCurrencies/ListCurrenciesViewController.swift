//
//  ListCurrenciesViewController.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import UIKit

class ListCurrenciesViewController: UIViewController, ListCurrenciesDisplayLogic {
    // MARK: VIP Variables
    var interactor: ListCurrenciesBusinessLogic?
    var router: ListCurrenciesRouter?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    var displayedCurrencies = [Currency]()
    
    // MARK: Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = ListCurrenciesInteractor()
        let presenter = ListCurrenciesPresenter()
        let router = ListCurrenciesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        fetchCurrencies()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchCurrencies() {
        interactor?.fetchCurrencies()
    }
    
    // MARK: Display Logic
    func displayFetchedCurrencies(viewModel: ListCurrencies.FetchCurrencies.ViewModel) {
        displayedCurrencies = viewModel.currencies
        tableView.reloadData()
    }
}

extension ListCurrenciesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
        let currency = displayedCurrencies[indexPath.row]
        cell.textLabel?.text = currency.name
        cell.detailTextLabel?.text = currency.symbol
        
        return cell
    }
}

extension ListCurrenciesViewController: UITableViewDelegate {
    
}
