//
//  CollectionViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

protocol ResultManagerProtocol {
    func fetchResult(result: SearchResult)
}

class ResultManager {
    
    static var shared = ResultManager()
    var delegate : ResultManagerProtocol!
    func fetchThenStoreData(fromURL urlString: String) {
        
        if let url = URL(string: urlString){
            
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error == nil{
                    if let data = data {
                        do {
                            
                            let decodedData = try JSONDecoder().decode(ResultModel.self, from: data)
                            
                            let resultCount = decodedData.resultCount
                            var mediaResults = [Media]()
                            
                            for index in 0...(resultCount-1) {
                                mediaResults.append(Media(trackName: decodedData.results[index].trackName ?? "", artistName: decodedData.results[index].artistName ?? ""))
                            }
                            
                            let searchResult = SearchResult(resultCount: resultCount, mediaResults: mediaResults)
                            self.delegate.fetchResult(result: searchResult)
                            
                        } catch let error {
                            print(error)
                        }
                    }

                }
            }
            dataTask.resume()
        }
    }
}
