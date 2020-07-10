//
//  ScreenShotCell.swift
//  AppStoreClone
//
//  Created by as on 7/10/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class ScreenShotCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.backgroundColor = .white
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
