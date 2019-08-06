//
//  StayDetailModel.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/06.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

// MARK: - StayList
// MARK: - StayList
struct StayDetailElement: Codable {
    let name, category, location, directions: String
    let route: [String]
    let mainImage: String
    let urlImage: [String]
    let introduce, serviceKinds, serviceIntroduce, serviceNotice: [String]
    let pickupNotice: String
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
