//
//  BaseTodayCell.swift
//  AppStoreClone
//
//  Created by as on 7/14/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class BaseTodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem?
    
    override var isHighlighted: Bool {
        didSet {
            var transform: CGAffineTransform = .identity
            
            if isHighlighted {
                
                transform = .init(scaleX: 0.9, y: 0.9)
                
                print("is isHighlighted \(isHighlighted)")
                
            }
            
            print("is isHighlighted \(isHighlighted)")
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.transform = .init(scaleX: 0.9, y: 0.9)
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16
        
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = .init(width: 0, height: 10)
        self.layer.shouldRasterize = true
        self.backgroundView?.layer.shouldRasterize = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
