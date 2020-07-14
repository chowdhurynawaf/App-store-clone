//
//  AppDetailsCell.swift
//  AppStoreClone
//
//  Created by as on 7/9/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class AppDetailsCell: UICollectionViewCell {
    
    var app: Result? {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    
    let appIconImageView     = UIImageView(cornerRadius: 12)
    let nameLabel            = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24) ,numberOfLines: 2)
    let whatsNewLabel        = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel    = UILabel(text: "Release Note", font: .systemFont(ofSize: 16),numberOfLines: 0)
    let priceButton            = UIButton(title: "$4.0")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appIconImageView.backgroundColor = .white
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 16
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.backgroundColor = #colorLiteral(red: 0.08289764076, green: 0.4925034642, blue: 0.982892096, alpha: 1)
        priceButton.constrainWidth(constant: 80)
        
        let stackView = VerticalStackView(arrangedSubViews: [UIStackView(arrangedSubviews: [appIconImageView,VerticalStackView(arrangedSubViews: [nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()],spacing: 12)], customSpacing: 20),whatsNewLabel,releaseNotesLabel], spacing: 16)
        
        
//        let stackView = VerticalStackView(arrangedSubViews: [
//
//
//            UIStackView(arrangedSubviews: [
//
//                appIconImageView,
//                VerticalStackView(arrangedSubViews: [
//                    nameLabel,
//                    UIStackView(arrangedSubviews: [
//                        priceButton,
//                        UIView()
//
//                        ])
//
//                    ], spacing: 12)
//
//                ],customSpacing: 20)
//            ,
//            whatsNewLabel,
//            releaseNotesLabel
//
//            ]
//
//            , spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
