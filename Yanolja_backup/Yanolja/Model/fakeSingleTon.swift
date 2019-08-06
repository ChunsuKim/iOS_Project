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
    
    var recentlyArrInMainView:[SearchClass] = [SearchClass(searchPointName: "노원역1", date: "7월7일 ~ 7월 12일", adultsNumber: 2, kidsNumber: 1), SearchClass(searchPointName: "건대2", date: "7월17일 ~ 7월 22일", adultsNumber: 3, kidsNumber: 0), SearchClass(searchPointName: "라면3", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역4", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "김치5", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3)]
    
    
    var recentlyArrInDetailView:[SearchClass] = []
    
    var region: String?
    var date: String?
    var numberOfPeople: String?
    
    var todayString = ""
    var tomorrowString = ""

    var adultCount = 2
    var childCount = 0
    
    

    
    var saveDate: [Date] = []
    let checkInTime = "+22:00:00"
    let checkOutTime = "+11:00:00"

    
    var saveSearchList: [SearchStruct] = []
    
    var stayID: Int = 0



    
}


// 요일 체크 함수
func day(of:Int) -> String {
    switch of {
    case 2: return "월"
    case 3: return "화"
    case 4: return "수"
    case 5: return "목"
    case 6: return "금"
    case 7: return "토"
    default:return "일"
    }
}


//2019-07-01 11:00:00



