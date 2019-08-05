//
//  HomeThemeNetwork.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeDataSource {
    
    static let shared = HomeThemeDataSource()
    private init() {}
    
    
    func fetchBigSale(completion: @escaping([HomeThemeGroup]?, Error?) -> ()) {
        let apiUrl = "http://www.yanoljamvp.com/api/?bigSale=True"
        fetchThemeGroup(apiUrl: apiUrl, completion: completion)
    }
    
    func fetchPartyRoom(completion: @escaping([HomeThemeGroup]?, Error?) -> ()) {
        let apiUrl = "http://www.yanoljamvp.com/api/?partyRoom=True"
        fetchThemeGroup(apiUrl: apiUrl, completion: completion)
    }
    
    
    func fetchSwimmingPool(completion: @escaping([HomeThemeGroup]?, Error?) -> ()) {
        let apiUrl = "http://www.yanoljamvp.com/api/?swimmingPool=True"
        fetchThemeGroup(apiUrl: apiUrl, completion: completion)
    }
    
    func fetchSpa(completion: @escaping([HomeThemeGroup]?, Error?) -> ()) {
        let apiUrl = "http://www.yanoljamvp.com/api/?spa=True"
        fetchThemeGroup(apiUrl: apiUrl, completion: completion)
    }
    
    func fetchThemeGroup(apiUrl: String, completion: @escaping([HomeThemeGroup]?, Error?) -> Void) {
        fetchGenericJSONData(apiUrl: apiUrl, completion: completion)
    }
    
    func fetchGenericJSONData<T: Codable>(apiUrl:String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: apiUrl) else { return }
        
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




