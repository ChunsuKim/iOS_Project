//
//  MapNetwork.swift
//  Yanolja
//
//  Created by Chunsu Kim on 08/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

class MapSearch {
    
    static let shared = MapSearch()
    private init() {}
    
    var currentAddress: String = ""
    var mapSearchList = [SearchStruct]()
    
    
    func currentRegionSearch(currentAddress:String, personnel:Int,requestCheckIn:String,requestCheckOut:String ,completion: @escaping () -> ()) {
        let todoEndpoint = "http://api.yanoljamvp.com/api/stay/"
        let query = "currentAddress=\(currentAddress)&personnel=\(personnel)&requestCheckIn=\(requestCheckIn)&requestCheckOut=\(requestCheckOut)"
        var urlComp = URLComponents(string: todoEndpoint)
        urlComp?.query = query
        guard let url = urlComp?.url else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else { return print(error!.localizedDescription)}
            guard let response = response as? HTTPURLResponse,
                200..<300 ~= response.statusCode ,
                response.mimeType == "application/json"
                else { return print("StatusCode is not valid")}
            guard let data = data else {
                return print("Error: did not receive data")
            }
            guard let regionData = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]] else { return print("Could not get parsed data")}
            //                print(response.statusCode) // print 201 나옴.
            singleTon.saveRegionSearchList.removeAll()
            for x in regionData {
                guard let directions = x["directions"] as? String ,
                    let mainImage = x["mainImage"] as? String,
                    let category = x["category"] as? String,
                    let stay = x["stay"] as? String,
                    let stayId = x["stayId"] as? Int,
                    let totalComments = x["totalComments"] as? Int,
                    let averageGrade = x["averageGrade"] as? Double,
                    let ownerComments = x["ownerComments"] as? Int,
                    let hoursPrice = x["hoursPrice"] as? String,
                    let hoursAvailable = x["hoursAvailable"] as? Int,
                    let saleHoursPrice = x["saleHoursPrice"] as? String,
                    let daysCheckIn = x["daysCheckIn"] as? Int,
                    let daysPrice = x["daysPrice"] as? String,
                    let saleDaysPrice = x["saleDaysPrice"] as? String else {return}
                let temp = SearchStruct(directions: directions, mainImage: mainImage, category: category, stay: stay, stayId: stayId, totalComments: totalComments, averageGrade: averageGrade, ownerComments: ownerComments, hoursPrice: hoursPrice, hoursAvailable: hoursAvailable, saleHoursPrice: saleHoursPrice, daysCheckIn: daysCheckIn, daysPrice: daysPrice, saleDaysPrice: saleDaysPrice)
                singleTon.saveRegionSearchList.append(temp)
                print("temp: ", temp)
            }
            completion()
//            print(singleTon.saveRegionSearchList[0])
        }
        task.resume()
    }
}
