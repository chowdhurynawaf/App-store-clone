//
//  AppsController.swift
//  AppStoreClone
//
//  Created by as on 7/7/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class AppsPageController : BaseListController {
    
    let cellId = "id"
    let headerId = "headerId"
    
    let activityIndicatorView : UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: "id")
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchdata()
    }
    
    //var editorsChoiceGame : AppGroup?
    var groups = [AppGroup]()
    var socialApps = [SocialApp]()
    
    fileprivate func fetchdata() {
        
        
        var group1 : AppGroup?
        var group2 : AppGroup?
        var group3 : AppGroup?
        
        
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        Service.shared.fetchGames { (appGroup, err) in
            dispatchGroup.leave()
            group1 = appGroup
            
     
        }
 
        dispatchGroup.enter()
        
        Service.shared.fetchTopGrossing { (appGroup, err) in
            
            dispatchGroup.leave()
            
            group2 = appGroup
            
            
        }
        
 
        dispatchGroup.enter()
        
        Service.shared.fetchTopFree { (appGroup, err) in
            
            dispatchGroup.leave()
            
            group3 = appGroup
            
            
        }
        
        // Mark:- social
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { (apps, err) in
            
            dispatchGroup.leave()
            self.socialApps = apps ?? []
            DispatchQueue.main.async {
                
            }
            
        }
        
        
        dispatchGroup.notify(queue: .main) {
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groups.append(group)
            }
            
            if let group = group2 {
                self.groups.append(group)
            }
            
            if let group = group3 {
                self.groups.append(group)
            }
            
            self.collectionView.reloadData()
            
            
            
        }
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        let appGroups = groups[indexPath.item]
        
        cell.titleLabel.text = appGroups.feed.title
        cell.horizontalController.appGroup = appGroups
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
}

extension AppsPageController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socialApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
}




