//
//  fakeSingleTon.swift
//  Yanolja
//
//  Created by brian은석 on 22/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation
class SingleTon {
    static let standard = SingleTon()
    private init(){}
    
    var recentlyArrInMainView:[SearchClass] =
        [SearchClass(searchPointName: "노원역", date: "7월7일 ~ 7월 12일", adultsNumber: 2, kidsNumber: 1), SearchClass(searchPointName: "건대", date: "7월17일 ~ 7월 22일", adultsNumber: 3, kidsNumber: 0), SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3)]
    var recentlyArrInDetailView:[SearchClass] = []
    
    var region: String?
    var date: String?
    var numberOfPeople: String?
    
    
}

//struct SearchData {
//    var region:String
//    var date:String
//    var numberOfPeople:String = "           성인 2, 아동 0"
//    init(region:String, date:String,numberOfPeople: String) {
//        self.region = region
//        self.date = date
//        self.numberOfPeople = numberOfPeople
//    }
//}



