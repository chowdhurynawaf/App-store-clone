//
//  PreViewCell.swift
//  AppStoreClone
//
//  Created by as on 7/10/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class PreViewCell: UICollectionViewCell {
    
    let previewLabel  = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 20))
    let horizontalController = PreViewScreenShotController()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(horizontalController.view)
        addSubview(previewLabel)
        previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor , padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        horizontalController.view.anchor(top: previewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
}
