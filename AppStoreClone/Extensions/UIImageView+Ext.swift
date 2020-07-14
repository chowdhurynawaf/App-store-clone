//
//  UIImageView+Ext.swift
//  AppStoreClone
//
//  Created by as on 7/8/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius : CGFloat){
        self.init(image:nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

