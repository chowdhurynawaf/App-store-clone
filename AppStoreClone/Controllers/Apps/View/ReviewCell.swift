//
//  ReviewCell.swift
//  AppStoreClone
//
//  Created by as on 7/10/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    
    let titleLabel = UILabel(text: "title", font: .boldSystemFont(ofSize: 18))
    let authorlabel = UILabel(text: "author", font: .systemFont(ofSize: 16))
    let starLabel = UILabel(text: "star", font: .systemFont(ofSize: 13))
    let bodyLabel = UILabel(text: "body", font: .systemFont(ofSize: 14),numberOfLines: 5)
    
    
    var starStackView : UIStackView = {
        
            var arrangedSubviews = [UIView]()
        (0..<5).forEach ({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainHeight(constant: 24)
            imageView.constrainWidth(constant: 24)
            arrangedSubviews.append(imageView)
        })
        
        arrangedSubviews.append(UIView())
        
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        clipsToBounds = true
        layer.cornerRadius = 16
        
        let stackView = VerticalStackView(arrangedSubViews: [
            
            UIStackView(arrangedSubviews: [
                titleLabel ,  authorlabel
                ],customSpacing: 8),
            starStackView,
            bodyLabel
            
            
            ],spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorlabel.textAlignment = .right
        
        
        addSubview(stackView)
        //stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor , padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
