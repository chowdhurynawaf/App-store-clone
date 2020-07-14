//
//  AppFullscreenHeaderCell.swift
//  AppStoreClone
//
//  Created by as on 7/14/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    //    let closeButton: UIButton = {
    //        let btn = UIButton()
    //        btn.setImage( #imageLiteral(resourceName: "close_button"), for: .normal)
    //
    //        return btn
    //    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()
        
        //        addSubview(closeButton)
        //        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 44, left: 0, bottom: 0, right: 12), size: .init(width: 80, height: 38))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
