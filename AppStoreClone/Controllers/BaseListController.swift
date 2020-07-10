//  BaseListController.swift
//  AppStoreClone
//
//  Created by as on 7/7/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


class BaseListController : UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
