//
//  UIView+Extension.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
