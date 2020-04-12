//
//  JSONDecode.swift
//  Cornoa Charts
//
//  Created by Roy Akash on 12/04/20.
//  Copyright © 2020 theroyakash. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var dataSet = [CasesTimeSeries]()
    var max = 0
    
    func fetchData(){
        if let url = URL(string: "https://api.covid19india.org/data.json"){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async{
                                self.dataSet = results.cases_time_series
                            }
                        } catch {
                            print("Decoding error \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
