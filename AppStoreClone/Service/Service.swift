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

                
            }catch let jsonerr {
                print(jsonerr.localizedDescription)
                completion([],err)
            }
            
            }.resume()
    }
    
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        
 
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        
        
        
        fetchappGroup(urlString: urlString, completion: completion)
        
        
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        
         //"https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        
        
        fetchappGroup(urlString: urlString, completion: completion)
        
        
    }
    
    func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"
        
        //"https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        
        
        fetchappGroup(urlString: urlString, completion: completion)
        
        
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
      
        
        
    }
    
    
    func fetchappGroup(urlString:String,completion:@escaping (AppGroup?,Error?)->Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil,err)
                print(err.localizedDescription)
                return
            }
            
            
            
            guard let data = data else { return }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(appGroup,nil)
                
                
            }catch let jsonerr {
                completion(nil,err)
                print(jsonerr.localizedDescription)
            }
            
            }.resume()
        
        
    }
    
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?)-> ()) {
        
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if let error = error {
                print("Failed to fetch apps:", error)
                completion(nil, error)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data!)
                
                completion(object, nil)
            } catch let jsonError {
                completion(nil, error)
                print("Failed to decode json:", jsonError)
            }
            
            }.resume()
        
    }
}
