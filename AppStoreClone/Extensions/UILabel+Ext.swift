//
//  UILabel+Ext.swift
//  AppStoreClone
//
//  Created by as on 7/7/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text : String , font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
}

}
