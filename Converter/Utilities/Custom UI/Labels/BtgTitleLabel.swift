//
//  BtgTitleLabel.swift
//  Converter
//
//  Created by Ian McDonald on 16/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import UIKit

class BtgTitleLabel: UILabel {
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
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .subheadline)
        textColor = UIColor(named: .label)
        adjustsFontForContentSizeCategory = true
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
