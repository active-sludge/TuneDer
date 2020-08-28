//
//  DatabaseManager.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 21.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import Foundation
import RealmSwift

struct DatabaseManager {
    
    let realm = try! Realm()
    
    func save(toDatabase media: Media) {
        DispatchQueue.main.async {
            do {
                try self.realm.write {
                    self.realm.add(media)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func retrieveAsArray() -> [Media] {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let medias = realm.objects(Media.self)
        
        let mediaResults = Array(medias)
        
        return mediaResults
    }
}
