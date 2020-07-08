//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by as on 7/5/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult : Result! {
        didSet{
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            
            if let rating = appResult.averageUserRating {
                ratingsLabel.text = "Rating : \(rating.rounded() ?? 0) "
            }
            
            let url = URL(string: appResult.artworkUrl100)
            appIconimageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let view = UIView()
    
    let appIconimageView : UIImageView =  {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive  = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "Photos & Videos"
        return label
    }()
    
    let ratingsLabel : UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor  = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    lazy var screenshot1ImageView = createScreenShotImageView()
    lazy var screenshot2ImageView = createScreenShotImageView()
    lazy var screenshot3ImageView = createScreenShotImageView()

    
    
    func createScreenShotImageView() ->UIImageView {
        
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
//
//        let labelStackView = UIStackView(arrangedSubviews: [
//            nameLabel,categoryLabel,ratingsLabel
//
//        ])
//        labelStackView.axis = .vertical
        
        
        let labelStackView = VerticalStackView(arrangedSubViews: [
            
             nameLabel,categoryLabel,ratingsLabel
            
            ])
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconimageView , labelStackView , getButton
        
        ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
        screenshot1ImageView,screenshot2ImageView,screenshot3ImageView
        ])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
//        let overAllStackView = UIStackView(arrangedSubviews: [
//        infoTopStackView,screenShotStackView
//
//        ])
        
        let overAllStackView  = VerticalStackView(arrangedSubViews: [
           infoTopStackView,screenShotStackView
            ], spacing: 16)
        
        
        
//        overAllStackView.axis = .vertical
//        overAllStackView.spacing = 16


        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            stackView.topAnchor.constraint(equalTo: self.topAnchor),
//            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 16),
//            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: -16),
//            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
