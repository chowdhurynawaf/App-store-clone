//
//  UIButton+Ext.swift
//  AppStoreClone
//
//  Created by as on 7/8/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title:String) {
        self.init(type:.system)
        self.setTitle(title, for: .normal)
    }
}

