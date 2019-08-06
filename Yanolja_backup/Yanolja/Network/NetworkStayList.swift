//
//  NetworkStay.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation
import Alamofire

class WebAPI {

    static let shared = WebAPI()
    private init() {}
    
    func getTestAPI(completed:@escaping (_ posts: [StayListElement])->Void){
        guard let url = URL(string: "http://www.yanoljamvp.com/api/stay/") else {return}
        AF.request(url, method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            DispatchQueue.main.async {
                do{
                    let result = try JSONDecoder().decode([StayListElement].self, from: data)
                    completed(result)
                }
                catch{}
            }
            
        }
    }
    
    func locationStayAPI(stayId: Int, completed: @escaping (_ posts: StayDetailElement) -> ()) {
        guard let url = URL(string: "http://www.yanoljamvp.com/api/stay/detail/\(stayId)") else { return }
        
        AF.request(url, method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            do{
                let result = try JSONDecoder().decode(StayDetailElement.self, from: data)
                completed(result)
            }
            catch{
                print("error :", error)
            }
        }
    }
    
}
