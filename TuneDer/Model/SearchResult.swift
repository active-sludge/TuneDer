//
//  SearchResult.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 14.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import Foundation

struct SearchResult {
    let resultCount: Int
    let mediaResults: [Media]

}

struct Media {
    var trackName: String
    var artistName: String

}
