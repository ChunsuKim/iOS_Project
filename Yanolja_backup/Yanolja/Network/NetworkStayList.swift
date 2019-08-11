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
    
    // stay list api
    func getTestAPI(completed:@escaping (_ posts: [StayListElement])->Void){
        guard let url = URL(string: "http://api.yanoljamvp.com/api/stay/") else {return}
        AF.request(url, method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            do{
                let result = try JSONDecoder().decode([StayListElement].self, from: data)
                completed(result)
            }
            catch{}
            
        }
    }
    // stay detail api
    func locationStayAPI(stayId: Int, completed: @escaping (_ posts: StayDetailElement) -> ()) {
        guard let url = URL(string: "http://api.yanoljamvp.com/api/stay/detail/\(stayId)") else { return }
        
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
    
    // room list api
    func roomListApi(stayId: Int, completed: @escaping (_ posts: [StayDetailRoomElement]) -> ()) {
        guard let url = URL(string: "http://api.yanoljamvp.com/api/stay/\(stayId)/room/") else { return }
        
        AF.request(url, method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            do{
                let result = try JSONDecoder().decode([StayDetailRoomElement].self, from: data)
                completed(result)
            }
            catch{
                print("error :", error)
            }
        }
    }
    
    // room detail api
    func roomDetailApi(roomId: Int, requestCheckInDate: String, requestCheckOutDate: String, completed: @escaping (_ posts: RoomDetailElement) -> ()) {
        guard let url = URL(string: "http://api.yanoljamvp.com/api/stay/room/detail/\(roomId)/?requestCheckIn=\(requestCheckInDate)+20:00:00&requestCheckOut=\(requestCheckOutDate)+11:00:00") else { return }
        
        AF.request(url, method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            do{
                print("#### :", url)
                let result = try JSONDecoder().decode(RoomDetailElement.self, from: data)
                completed(result)
            }
            catch{
                print("error :", error)
            }
        }
        print("$$$$ :", url)
    }
}
