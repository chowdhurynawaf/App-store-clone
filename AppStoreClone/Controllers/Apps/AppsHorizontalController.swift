//
//  AppsHorizontalController.swift
//  AppStoreClone
//
//  Created by as on 7/7/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsHorizontalController: BaseListController {
    let topBottomPadding : CGFloat = 24
    let lineSpacing      : CGFloat = 20
    
    var appGroup : AppGroup?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            
            
            layout.scrollDirection = .horizontal
        }
    }
    
    
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.nameLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }

}


extension AppsHorizontalController : UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - (topBottomPadding) - (lineSpacing) ) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16)
    }
}


