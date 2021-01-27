//
//  CurrenciesViewModel.swift
//  CurrencyRate
//
//  Created by Валентин Петруля on 27.01.2021.
//

import Foundation

class CurrenciesViewModel: ObservableObject {
    
    @Published var currencies = Array(repeating: CurrencyViewModel(currency: CurrencyModel(rate: 0, cc: "")), count: 61)
    @Published var date = Date()
    @Published var selectedCurrencyIndex = 0
    @Published var amount = ""
    
    var webservice = Webservice()
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let string = formatter.string(from: date)
        print(string)
        return string
    }
    
    var calculatedAmount: String {
        let amountDouble = Double(amount) ?? 0
        let calculatedAmountDouble = amountDouble * currencies[selectedCurrencyIndex].rate
        return String(format: "%.2f", calculatedAmountDouble)
    }
    
    init() {
        getCurrencies()
    }
    
    func getCurrencies() {
        webservice.fetchData(date: dateString) { currencies in
            if let currencies = currencies {
                self.currencies = currencies.map(CurrencyViewModel.init)
            }
        }
    }
}
