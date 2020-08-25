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
    
    func save(toDatabase media: Media) {
       
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(media)
            }
        } catch {
            print(error)
        }
    
    }
}
