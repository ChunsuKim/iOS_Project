//
//  HomeThemePartyRoom.swift
//  Yanolja
//
//  Created by Chunsu Kim on 04/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

struct HomeThemePartyRoom: Codable {
    
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
