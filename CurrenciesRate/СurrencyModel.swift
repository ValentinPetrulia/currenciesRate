//
//  ConcurrencyModel.swift
//  CurrencyApp
//
//  Created by Валентин Петруля on 25.01.2021.
//

import Foundation
import Combine

struct CurrencyModel: Decodable {
    var rate: Double
    var cc: String
}
