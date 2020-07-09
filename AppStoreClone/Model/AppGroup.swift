//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by as on 7/8/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let id: String
}
