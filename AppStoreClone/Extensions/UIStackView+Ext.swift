//
//  UIStackView+Ext.swift
//  AppStoreClone
//
//  Created by as on 7/9/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


extension UIStackView {
    
    convenience init (arrangedSubviews:[UIView] , customSpacing : CGFloat = 0 ) {
    self.init(arrangedSubviews : arrangedSubviews)
    self.spacing = customSpacing
}
}
