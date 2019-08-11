//
//  StayDetailModel.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/06.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

// MARK: - StayList
struct StayDetailElement: Codable {
    let name, category, location, directions: String
    let route: [String]
    let mainImage: String
    let urlImage: [String]
    let introduce: [String]
    let serviceKinds: [String]
    let serviceIntroduce, serviceNotice, pickupNotice: [String]
    let like: Bool
    let stayID, totalComments: Int
    let averageGrade: Double
    let totalGrade: [Int]
    let ownerComments: Int
    
    enum CodingKeys: String, CodingKey {
        case name, category, location, directions, route, mainImage, urlImage, introduce, serviceKinds, serviceIntroduce, serviceNotice, pickupNotice, like
        case stayID = "stayId"
        case totalComments, averageGrade, totalGrade, ownerComments
    }
}

// MARK: - StayListElement
struct StayDetailRoomElement: Codable {
    let name: String
    let standardPersonnel, maximumPersonnel, hoursAvailable, daysCheckIn: Int
    var hoursPrice, saleHoursPrice, daysPrice, saleDaysPrice: String
    let basicInfo: [String]
    let urlImage: [String]
    let roomID, stayID: Int
    let stay: String
    
    enum CodingKeys: String, CodingKey {
        case name, standardPersonnel, maximumPersonnel, hoursAvailable, daysCheckIn, hoursPrice, saleHoursPrice, daysPrice, saleDaysPrice, basicInfo, urlImage
        case roomID = "roomId"
        case stayID = "stayId"
        case stay
    }
}

// MARK: - StayList
struct RoomDetailElement: Codable {
    let stay, name: String
    let hoursUntil, hoursAvailable: Int
    let hoursPrice, saleHoursPrice: String
    let daysCheckIn, daysCheckOut: Int
    let daysPrice, saleDaysPrice: String
    let basicInfo, reservationNotice, cancelRegulation: [String]
    let urlImage: [String]
    let stayID, roomID: Int
//    let reservedList: [String]
    let stayAvailable: Bool
    
    enum CodingKeys: String, CodingKey {
        case stay, name, hoursUntil, hoursAvailable, hoursPrice, saleHoursPrice, daysCheckIn, daysCheckOut, daysPrice, saleDaysPrice, basicInfo, reservationNotice, cancelRegulation, urlImage
        case stayID = "stayId"
        case roomID = "roomId"
        case stayAvailable
    }
}
