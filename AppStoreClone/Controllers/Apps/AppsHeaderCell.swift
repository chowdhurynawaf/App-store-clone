//
//  AppsHeaderCell.swift
//  AppStoreClone
//
//  Created by as on 7/8/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 13))
    let titleLabel   = UILabel(text: "Connects People", font: .systemFont(ofSize: 24))
    let imageView    = UIImageView(cornerRadius: 8)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor    = .blue
        imageView.backgroundColor = .red
        titleLabel.numberOfLines  = 2
        
        let stackView = VerticalStackView(arrangedSubViews: [
            
            companyLabel,
            titleLabel,
            imageView
            ],spacing: 12)
        
        //stackView.spacing = 12
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
