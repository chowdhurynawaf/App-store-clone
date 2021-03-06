//
//  AppRowCell.swift
//  AppStoreClone
//
//  Created by as on 7/8/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit




class AppRowCell: UICollectionViewCell {
    
    let imageView      = UIImageView(cornerRadius: 8)
    let nameLabel      = UILabel(text: "App Name", font: .systemFont(ofSize:20))
    let companyLabel   = UILabel(text: "Company name", font: .systemFont(ofSize: 13))
    let getButton      = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .green
        
        
        imageView.backgroundColor = .blue
        imageView.constrainHeight(constant: 64)
        imageView.constrainWidth(constant: 64)
        //imageView.widthAnchor.constraint(equalToConstant: 64)
        //imageView.heightAnchor.constraint(equalToConstant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32/2
        
        let stackView = UIStackView(arrangedSubviews: [
            
            imageView,VerticalStackView(arrangedSubViews: [nameLabel,companyLabel],spacing: 4),getButton])
        
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
