//
//  BtgNumberTextField.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import UIKit

class BtgNumberTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: .highlight).cgColor
        
        textColor = UIColor(named: .label)
        tintColor = UIColor(named: .label)
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontForContentSizeCategory = true
        
        backgroundColor = UIColor(named: .main)
        autocorrectionType = .no
        keyboardType = .decimalPad
        returnKeyType = .go
        clearButtonMode = .whileEditing
        placeholder = PlaceholderText.textField.rawValue
    }

}
