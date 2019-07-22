//
//  SearchStruct.swift
//  Yanolja
//
//  Created by brian은석 on 10/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//
import Foundation


class SearchClass {
    let searchPointNameLabel :String
    let dateLabel :String
    let numberOfPeopleLabel :String
    init(searchPointName: String , date: String, adultsNumber: Int, kidsNumber: Int) {
        self.searchPointNameLabel = searchPointName
        self.dateLabel = date
        self.numberOfPeopleLabel = "성인:\(adultsNumber)명,아동:\(kidsNumber)명"
    }
}
