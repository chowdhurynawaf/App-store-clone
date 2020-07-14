//
//  TodayItem.swift
//  AppStoreClone
//
//  Created by as on 7/14/20.
//  Copyright © 2020 nawaf. All rights reserved.
//


import UIKit

struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    let cellType: CellType
    
    var apps:[FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
}
