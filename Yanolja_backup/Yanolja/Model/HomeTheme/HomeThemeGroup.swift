//
//  HomeThemeGroup.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

struct HomeThemeGroup: Codable {
    
    let directions: String
    let mainImage: String
    let category: String
    let stay: String
    let stayId: Int
    let totalComments: Int
    let averageGrade: Double
    let ownerComments: Int
    let hoursPrice: String
    let hoursAvailable: Int
    let saleHoursPrice: String
    let daysCheckIn: Int
    let daysPrice: String
    let saleDaysPrice: String
}

let menubarDataFirstTheme = ["빅세일", "파티룸", "수영장", "스파"]
let menubarDataSecondTheme = ["수영장", "스파", "빅세일", "파티룸"]
let menubarDataThirdTheme = ["리조트", "바닷가", "계곡", "호캉스"]
let menubarDataForthTheme = ["계곡", "호캉스", "리조트", "바닷가"]

let themeTitleFirst = "핫썸머 핫캉스"
let themeTitleSecond = "첨벙첨벙 물놀이하러 Go!"
let themeTitleThird = "당장 떠나자! 여름휴가~"
let themeTitleFourth = "여긴 하이텐션 각★"
let themeTitleFifth = "커플맞춤 풀빌라"
let themeTitleSixth = "백만불짜리 썬셋명소"
