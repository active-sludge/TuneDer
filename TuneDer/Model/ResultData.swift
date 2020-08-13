//
//  ResultData.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import Foundation

// MARK: - ResultData
struct ResultData: Codable {
    let resultCount: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
   
    let wrapperType: String?
    let kind: String?
    let artistID, collectionID, trackID: Int?
    let artistName: String?
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: Date?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let collectionArtistName: String?

}
