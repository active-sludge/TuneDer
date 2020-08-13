//
//  ResultManager.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import Foundation
import Alamofire

struct ResultManager {
    
    let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson")
    
    func fetchResult() {
        
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            do {
                let resultData = try JSONDecoder().decode(ResultData.self, from: data!)
                
                print(resultData.resultCount)
                print(resultData.results[0].artistID)
                print(resultData.results[0].artistName)
                print(resultData.results[0].trackName)
                print(resultData.results[0].trackPrice)
                
            } catch  {
                print("There was an error")
            }
            
        }.resume()
        
        
    }
}
