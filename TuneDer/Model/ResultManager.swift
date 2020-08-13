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
    
    func fetchResult() {
        
        //        let apiString = "https://itunes.apple.com"
        //        let endPointString = "/search?"
        //        let queryString = "term=jack+johnson"
        
        let apiString = "https://reqres.in/api"
        let endPointString = "users?"
        let queryString = "page=2"
        let urlString = apiString + endPointString + queryString
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let resultData = try decoder.decode(ResultData.self, from: data!)
                    
                    print(resultData)
                    print(resultData.resultCount!)
                    print(resultData.results![0].artistID!)
                    print(resultData.results![0].artistName!)
                    print(resultData.results![0].trackName!)
                    print(resultData.results![0].trackPrice!)
                    
                } catch {
                    print("There was an error")
                }
            }
        }
        
        dataTask.resume()
        
    }
}
