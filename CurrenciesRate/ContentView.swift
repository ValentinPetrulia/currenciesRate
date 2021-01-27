//
//  ContentView.swift
//  CurrencyRate
//
//  Created by Валентин Петруля on 26.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currenciesVM = CurrenciesViewModel()
    
    let minDate = Calendar.current.date(byAdding: .year, value: -20, to: Date())
    let maxDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Amount: ", text: $currenciesVM.amount)
                    .keyboardType(.decimalPad)
                
                Text("\(currenciesVM.calculatedAmount)")
                
                Picker("Currency", selection: $currenciesVM.selectedCurrencyIndex) {
                    ForEach(0..<currenciesVM.currencies.count) {
                        Text("\(currenciesVM.currencies[$0].code):  " + "\(String(format: "%.2f", currenciesVM.currencies[$0].rate))")
                    }
                }.onAppear(perform: {
                    currenciesVM.getCurrencies()
                })
                
                DatePicker("Date", selection: $currenciesVM.date, in: minDate!...maxDate, displayedComponents: .date)
                    .onChange(of: currenciesVM.date, perform: { value in
                        currenciesVM.getCurrencies()
                    })
                
            }.navigationBarTitle("Currrencies", displayMode: .inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
