//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by as on 7/6/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

struct SearchResult:Decodable {
    let resultCount : Int
    let results : [Result]
}


struct Result : Decodable {
    let trackName : String
    let primaryGenreName : String
    var averageUserRating: Float?
    let artworkUrl100 : String
    let screenshotUrls : [String]
}

