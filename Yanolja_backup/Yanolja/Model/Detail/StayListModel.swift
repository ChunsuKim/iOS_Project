//
//  StayListModel.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

// MARK: - URLString
enum RequestString: String {
    case stayList = "http://www.yanoljamvp.com/api/stay/"
}

// MARK: - StayListElement
struct StayListElement: Codable {
    let directions: String
    let mainImage: String
    let category: Category
    let stay: String
    let stayID, totalComments: Int
    let averageGrade: Double
    let ownerComments: Int
    let hoursPrice: String
    let hoursAvailable: Int
    let saleHoursPrice: String
    let daysCheckIn: Int
    let daysPrice, saleDaysPrice: String
    
    enum CodingKeys: String, CodingKey {
        case directions, mainImage, category, stay
        case stayID = "stayId"
        case totalComments, averageGrade, ownerComments, hoursPrice, hoursAvailable, saleHoursPrice, daysCheckIn, daysPrice, saleDaysPrice
    }
}

enum Category: String, Codable {
    case 게스트하우스 = "게스트하우스"
    case 모텔 = "모텔"
    case 펜션풀빌라 = "펜션/풀빌라"
    case 호텔리조트 = "호텔/리조트"
}


typealias StayList = [StayListElement]

struct SearchStruct {
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
