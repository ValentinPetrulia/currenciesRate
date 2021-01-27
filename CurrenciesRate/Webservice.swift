//
//  Webservice.swift
//  CurrencyRate
//
//  Created by Валентин Петруля on 27.01.2021.
//

import Foundation

class Webservice {
    
    func fetchData(date: String, completion: @escaping ([CurrencyModel]?) -> ()) {
        guard let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?date=\(date)&json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let currenciesData = try? JSONDecoder().decode([CurrencyModel].self, from: data)
            DispatchQueue.main.async {
                completion(currenciesData)
            }
            
        }.resume()
    }
}
