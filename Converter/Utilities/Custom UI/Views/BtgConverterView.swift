//
//  BtgConverterView.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import UIKit

protocol BtgConverterViewDelegate {
    func requestConversion(_ converterView: BtgConverterView)
    func requestDisplayList(_ converterView: BtgConverterView)
}

class BtgConverterView: UIView {
    private let titleLabel = BtgTitleLabel()
    private let button = BtgSelectionButton(title: ButtonTitles.selectCurrency.rawValue)
    private let textField = BtgNumberTextField()
    
    var delegate: BtgConverterViewDelegate?
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var selectedCurrency: Currency? {
        didSet {
            if let selectedCurrency = selectedCurrency {
                button.set(title: selectedCurrency.name)
                delegate?.requestConversion(self)
            } else {
                button.set(title: ButtonTitles.selectCurrency.rawValue)
            }
        }
    }
    
    var conversionValue: String? {
        didSet {
            textField.text = conversionValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        configureView()
        configureTextField()
        layoutUI()
        configureActions()
    }
    
    private func configureView() {
        layer.cornerRadius = 8
        backgroundColor = UIColor(named: .accent)
    }
    
    private func configureTextField() {
        textField.text = PlaceholderText.initialValue.rawValue
    }
    
    private func layoutUI() {
        addSubviews(titleLabel, button, textField)
        let padding: CGFloat = 6
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: padding),
            textField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
    
    private func configureActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        textField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
    }
    
    @objc private func textFieldEdited() {
        conversionValue = textField.text
        delegate?.requestConversion(self)
    }

    @objc private func buttonTapped() {
        delegate?.requestDisplayList(self)
    }
}
