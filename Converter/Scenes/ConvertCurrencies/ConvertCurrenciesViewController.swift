//
//  ConvertCurrenciesViewController.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import UIKit

class ConvertCurrenciesViewController: UIViewController, ConvertCurrenciesDisplayLogic {
    // MARK: VIP Variables
    var interactor: ConvertCurrenciesBusinessLogic?
    var router: ConvertCurrenciesRouter?

    // MARK: Outlets
    @IBOutlet weak var baseConverterView: BtgConverterView!
    @IBOutlet weak var targetConverterView: BtgConverterView!
    
    
    // MARK: Variables
    var normalConversion = true
    
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
        let interactor = ConvertCurrenciesInteractor()
        let presenter = ConvertCurrenciesPresenter()
        let router = ConvertCurrenciesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    private func configureViews() {
        baseConverterView.delegate = self
        baseConverterView.titleText = "From"
        
        targetConverterView.delegate = self
        targetConverterView.titleText = "To"
    }
    
    // MARK: Display Logic
    func displayFetchedConversion(viewModel: ConvertCurrencies.FetchConversion.ViewModel) {
        if normalConversion {
            targetConverterView.conversionValue = viewModel.convertedValue
        } else {
            baseConverterView.conversionValue = viewModel.convertedValue
        }
    }
    
    func displayConversionError(viewModel: ConvertCurrencies.FetchConversion.ErrorViewModel) {
        let ac = UIAlertController(title: AlertController.errorTitle.rawValue,
                                   message: viewModel.errorText, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: AlertController.okButton.rawValue, style: .default))
        
        present(ac, animated: true)
    }

}

extension ConvertCurrenciesViewController: BtgConverterViewDelegate {
    func requestConversion(_ converterView: BtgConverterView) {
        var source: String?
        var target: String?
        
        if converterView === baseConverterView {
            source = baseConverterView.selectedCurrency?.symbol
            target = targetConverterView.selectedCurrency?.symbol
            normalConversion = true
        } else {
            source = targetConverterView.selectedCurrency?.symbol
            target = baseConverterView.selectedCurrency?.symbol
            normalConversion = false
        }
        
        if let source = source, let target = target, let value = converterView.conversionValue{
            let request = ConvertCurrencies.FetchConversion.Request(source: source,
                                                                    destination: target,
                                                                    baseValue: value)
            interactor?.fetchConversion(request: request)
        }
    }
    
    func requestDisplayList(_ converterView: BtgConverterView) {
        // MARK: Not sure how to implement Display
    }
}
