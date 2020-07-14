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



class AppSearchController: BaseListController {
    
    fileprivate let cellId = "id1234"
    var timer : Timer?
    
    fileprivate let enterSearchLabel:UILabel = {
        let label = UILabel()
        label.text = "Please enter your search keyword"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        //fetchItunesApps()
        setUPSearchBar()
        collectionView.addSubview(enterSearchLabel)
        enterSearchLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        
    }
    
    fileprivate func setUPSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    
    fileprivate var appResults = [Result]()
    
    

    fileprivate func fetchItunesApps() {
        
        Service.shared.fetchApps(searchResult: "apps") { results,err  in
            
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
        
        enterSearchLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        
        cell.appResult = appResult
        
        

        
        
        
        return cell
    }
    
    
   
    
}


extension AppSearchController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

extension AppSearchController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchResult: searchText) { (res, err) in
                
                self.appResults = res
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
 
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        
        let appDetailController = AppDetailController()
        let appId = appResults[indexPath.item].trackId
        appDetailController.appId = "\(appId)"

        navigationController?.pushViewController(appDetailController, animated: true)
        
    }
    
    
    
}
