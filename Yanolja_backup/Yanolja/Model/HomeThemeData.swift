//
//  HomeThemeData.swift
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
    let averageGrade: Int
    let ownerComments: Int
    let hoursPrice: String
    let hoursAvailable: Int
    let saleHoursPrice: String
    let daysCheckIn: Int
    let daysPrice: String
    let saleDaysPrice: String
}

var menubarData = ["빅세일", "파티룸", "수영장", "스파"]
