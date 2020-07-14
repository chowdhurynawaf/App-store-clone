//
//  VerticalStackView.swift
//  AppStoreClone
//
//  Created by as on 7/6/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubViews : [UIView] ,spacing : CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubViews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
