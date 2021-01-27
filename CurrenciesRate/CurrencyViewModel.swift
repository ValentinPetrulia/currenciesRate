//
//  CurrencyViewModel.swift
//  CurrencyRate
//
//  Created by Валентин Петруля on 27.01.2021.
//

import Foundation

struct CurrencyViewModel {
    var currency: CurrencyModel
    
    init(currency: CurrencyModel) {
        self.currency = currency
    }
    
    var code: String {
        return self.currency.cc
    }
    
    var rate: Double {
        return self.currency.rate
    }
}
