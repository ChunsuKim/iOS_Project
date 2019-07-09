//
//  fakeData.swift
//  Yanolja
//
//  Created by Chunsu Kim on 09/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

struct Pool {
    var title: String
    var imageName: String
    var price: String
}

struct DataManager {
    static var shared = DataManager()
    init() {}
    
    let pools: [Pool] = [
        Pool(title: "가평 하버하우스풀빌라", imageName: "pool1", price: "180,000"),
        Pool(title: "경주 에디스풀빌라펜션", imageName: "pool2", price: "69,000"),
        Pool(title: "여수 까사413펜션", imageName: "pool3", price: "100,000"),
        Pool(title: "경주 비버리힐펜션", imageName: "pool4", price: "80,000")
        
    ]
}
