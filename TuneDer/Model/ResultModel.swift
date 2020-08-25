//
//  ResultData.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import Foundation

// MARK: - ResultModel
struct ResultModel: Codable {
    var resultCount: Int
    var results: [MediaResult]
    
    // MARK: - MediaResult
    struct MediaResult: Codable {

        var artistId: Int64
        var trackId: Int64
        var artistName: String
        var trackName: String
        var artworkUrl100: String
    }
}


