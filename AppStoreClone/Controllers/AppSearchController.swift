//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by as on 7/5/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

fileprivate let cellId = "id1234"

class AppSearchController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesApps()
    }
    
    
    fileprivate var appResults = [Result]()
    
    

    fileprivate func fetchItunesApps() {
        
        Service.shared.fetchApps { results,err  in
            
            if let err = err {
                print(err.localizedDescription)
            }
            
            self.appResults = results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        
        cell.appResult = appResult
        
        

        
        
        
        return cell
    }
    
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension AppSearchController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
