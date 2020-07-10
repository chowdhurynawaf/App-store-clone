//
//  AppsPageHeader.swift
//  AppStoreClone
//
//  Created by as on 7/8/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
