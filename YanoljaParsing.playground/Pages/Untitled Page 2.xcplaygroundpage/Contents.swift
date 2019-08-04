//: [Previous](@previous)

import Foundation

//struct ThemeGroup: Codable {
//    let homeThemeBigSale: HomeThemeBigSale
//}

struct HomeThemeBigSale: Codable {
    
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

typealias HomeThemeGroup = [HomeThemeBigSale]

let apiUrl = "http://www.yanoljamvp.com/api/?bigSale=True"

let url = URL(string: apiUrl)!

let session = URLSession.shared

let task = session.dataTask(with: url) { (themeGroups, response, error) in
    if let error = error {
        print(error)
        return
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
        print("Invalid response")
        return
    }
    
    guard (200...299).contains(httpResponse.statusCode) else {
        print(httpResponse.statusCode)
        return
    }
    
    guard let themeGroups = themeGroups else {
        fatalError("Invalid Data")
    }
    
    do {
        let decoder = JSONDecoder()
        let themeGroup = try decoder.decode(HomeThemeGroup.self, from: themeGroups)
        
        themeGroup.first?.directions
        themeGroup.first?.stay
        themeGroup.first?.stayId
        themeGroup.first?.daysCheckIn
        themeGroup.first?.mainImage
        themeGroup.first?.category
        themeGroup.first?.hoursPrice
        themeGroup.first?.saleHoursPrice
        themeGroup.first?.daysPrice
        themeGroup.first?.saleDaysPrice

        themeGroup.last?.directions
        themeGroup.last?.stay
        themeGroup.last?.stayId
        themeGroup.last?.daysCheckIn
        themeGroup.last?.mainImage
        themeGroup.last?.category
        themeGroup.last?.hoursPrice
        themeGroup.last?.saleHoursPrice
        themeGroup.last?.daysPrice
        themeGroup.last?.saleDaysPrice
        
    } catch {
        print(error)
    }
}

task.resume()

//: [Next](@next)
