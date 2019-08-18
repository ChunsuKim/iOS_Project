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
 
    // 날짜 관련
    //오늘 날짜
    var todayString = ""
    var tomorrowString = ""
    var saveDate: [Date] = []
    var selectDateButtonCurrentTitle = ""
    // 위치
    var searchKeyword = "서울특별시 강남구"
    //
    var category = ""
    //사람수 관련!
    var adultCount = 2
    var childCount = 0
    var numberOfPeople = 2
    var selectNumberOfPeopleButtonCurrentTitle = ""

    // 체크인 체크아웃
    var checkInDate = ""
    var checkOutDate = ""
    let checkInTime = "+22:00:00"
    let checkOutTime = "+11:00:00"
    
    var checkInDateString = "8월 13일 (화)"
    var checkOutDateString = "8월 15일 (목)"
    
    var saveDetailSearchList: [StayListElement] = []
    
    // 돈관련
    var money = "70000"
    
    //지역검색시..
    var saveRegionSearchList: [StayListElement] = []
    var stayID: Int = 0
    var roomID: Int = 0

    // filter
    var filter = ""
    
    //로그인시..
    // 회원가입

    var loginUser: [UserID] = [UserID(email: "qed@naver.com", phoneNumber: "01011110000", password: "0000")]
    
    var walkToGo = "도보"
    var token = ""
    
    var mainColor = #colorLiteral(red: 0.9797077775, green: 0.07226980478, blue: 0.4098213315, alpha: 1)
    
    var nickName = "추카추카멍뭉이"
    var currentLocation = ""
}
struct UserID {
    let email: String
    let phoneNumber: String
    let password: String
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



