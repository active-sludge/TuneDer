//
//  CollectionViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit
import RealmSwift

protocol ResultManagerProtocol {
    func fetchResult(result: [Media])
}

class ResultManager {
    
    static var shared = ResultManager()
    let databaseManager = DatabaseManager()
    
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
                            let mediaList = List<Media>()
                            
                            for index in 0...(resultCount-1) {
                                let media = Media()
                                media.artistName = decodedData.results[index].artistName
                                media.trackName = decodedData.results[index].trackName
                                media.artworkUrl100 = decodedData.results[index].artworkUrl100
                                
                                mediaList.append(media)
                                mediaResults.append(media)
                            }
                            
                            print(mediaList)
                            
//                            self.databaseManager.save(toDatabase: mediaList)
                            self.delegate.fetchResult(result: mediaResults)
                            
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
