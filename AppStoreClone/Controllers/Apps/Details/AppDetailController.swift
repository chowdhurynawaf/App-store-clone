//
//  AppDetailController.swift
//  AppStoreClone
//
//  Created by as on 7/9/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController {
    var detailsCellId = "detailsCellId"
    var previewCellId = "previewCellId"
    var reviewCellId  = "reviewCellId"
    
    var appId : String!  {
        didSet{
            print("app id ",appId)
            let url = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSONData(urlString: url) { (result : SearchResult?, err) in
               
              let app = result?.results.first
              self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
                let reviewsUrl =  "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
            Service.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews:Reviews?, err) in
                if let err = err {
                    print("Failed to decode reviews" , err)
                }
                
                
                self.reviews = reviews
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
            
            
        }
    }
    
    var app : Result?
    var reviews : Reviews?
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: detailsCellId)
        collectionView.register(PreViewCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellId)
        navigationItem.largeTitleDisplayMode = .never
        
        
    }
}


extension AppDetailController : UICollectionViewDelegateFlowLayout{
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailsCellId, for: indexPath) as! AppDetailsCell
            
            cell.app = app
            return cell
        }
        else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreViewCell
            cell.horizontalController.app = self.app
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewRowCell
            
            cell.reviewController.reviews = self.reviews
            
            
            return cell
        }
        
//        cell.nameLabel.text = app?.trackName
//        cell.releaseNotesLabel.text = app?.releaseNotes
//        cell.appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
//        cell.priceButton.setTitle(app?.formattedPrice, for: .normal)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: view.frame.width, height: 300)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            
            let dummyCell = AppDetailsCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            
            dummyCell.app = app
            
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
            
        } else if indexPath.row == 1 {
            
            return .init(width: view.frame.width, height: 500)
            
        } else {
            
            return .init(width: view.frame.width, height: 280)
            
        }
        
    }
}
