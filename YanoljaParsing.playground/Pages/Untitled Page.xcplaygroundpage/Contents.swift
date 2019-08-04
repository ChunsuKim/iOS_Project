import UIKit

// MARK: - SwimmingPoolElement
struct SwimmingPoolElement: Codable {
    let directions: String
    let mainImage: String
    let category, stay: String
    let stayID, totalComments, averageGrade, ownerComments: Int
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

typealias SwimmingPool = [SwimmingPoolElement]


let apiUrl = "http://www.yanoljamvp.com/api/?bigSale=True"

let url = URL(string: apiUrl)!

let session = URLSession.shared

let task = session.dataTask(with: url) { (swimmingPoolElement, response, error) in
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
    
    guard let swimmingPoolElement = swimmingPoolElement else {
        fatalError("Invalid Data")
    }
    
    do {
        let decoder = JSONDecoder()
        let swimmingPool = try decoder.decode(SwimmingPool.self, from: swimmingPoolElement)
        
        swimmingPool.first?.directions
        swimmingPool.first?.stay
        swimmingPool.first?.stayID
        swimmingPool.first?.daysCheckIn
        swimmingPool.first?.mainImage
        swimmingPool.first?.category
        swimmingPool.first?.hoursPrice
        swimmingPool.first?.saleHoursPrice
        swimmingPool.first?.daysPrice
        swimmingPool.first?.saleDaysPrice
        
        swimmingPool.last?.directions
        swimmingPool.last?.stay
        swimmingPool.last?.stayID
        swimmingPool.last?.daysCheckIn
        swimmingPool.last?.mainImage
        swimmingPool.last?.category
        swimmingPool.last?.hoursPrice
        swimmingPool.last?.saleHoursPrice
        swimmingPool.last?.daysPrice
        swimmingPool.last?.saleDaysPrice
        
    } catch {
        print(error)
    }
}

task.resume()

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func swimmingPoolTask(with url: URL, completionHandler: @escaping (SwimmingPool?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
