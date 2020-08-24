//
//  SearchResult.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 14.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import Foundation
import RealmSwift

class Media: Object {
    @objc dynamic var trackName: String = ""
    @objc dynamic var artistName: String = ""
    @objc dynamic var artworkUrl100: String = ""
}
