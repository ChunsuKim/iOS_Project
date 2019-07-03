//
//  Service.swift
//  AppleAppStore
//
//  Created by Chunsu Kim on 03/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func fetchSearch(searchTerm: String, completion: @escaping(SearchResult?, Error?) -> ()) {
        let urlString = searchUrl
        fetchGenericJsonData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping(AppGroup?, Error?) -> ()) {
        let urlString = topGrossingUrl
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping(AppGroup?, Error?) -> ()) {
        let urlString = gamesUrl
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping(AppGroup?, Error?) -> ()) {
        let urlString = topFreeUrl
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping(AppGroup?, Error?) -> Void) {
        fetchGenericJsonData(urlString: urlString, completion: completion)
    }
    
    
    func fetchGenericJsonData<T: Codable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let objects = try decoder.decode(T.self, from: data)
                completion(objects, nil)
                
            } catch let jsonError {
                print("Failed to decode: ", jsonError.localizedDescription)
                completion(nil, jsonError)
            }
        }
        task.resume()
    }
}
