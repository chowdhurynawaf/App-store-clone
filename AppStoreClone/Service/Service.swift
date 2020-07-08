//
//  Service.swift
//  AppStoreClone
//
//  Created by as on 7/7/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class Service {
    
    
    static let shared = Service()
    
    func fetchApps(searchResult : String ,completion : @escaping ([Result] , Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchResult)&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
                completion([],err)
                return
            }
            
            
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                searchResult.results.forEach({print($0.trackName , $0.primaryGenreName)})
                
                completion(searchResult.results, nil)
//                self.appResults =  searchResult.results
//
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//
                
            }catch let jsonerr {
                print(jsonerr.localizedDescription)
                completion([],err)
            }
            
            }.resume()
        
        
    }
}
