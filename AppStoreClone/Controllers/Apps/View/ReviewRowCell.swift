//
//  ReviewRowCell.swift
//  AppStoreClone
//
//  Created by as on 7/10/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class ReviewRowCell : UICollectionViewCell {
    
    let reviewController = ReviewController()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
