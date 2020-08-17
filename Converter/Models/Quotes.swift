//
//  Quotes.swift
//  Converter
//
//  Created by Ian McDonald on 17/08/20.
//  Copyright © 2020 Ian McDonald. All rights reserved.
//

import Foundation

struct Quotes: Hashable, Codable {
    let list: [String: Double]
}

struct LiveQuotes: Codable {
    let quotes: [String: Double]
}
