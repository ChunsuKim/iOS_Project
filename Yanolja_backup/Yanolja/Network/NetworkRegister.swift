//
//  Network.swift
//  Yanolja
//
//  Created by brian은석 on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

// 회원가입
func loginRegister(realname:String, phoneNumber:String, email:String, password:String, completion: @escaping () -> ()) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "http://yanoljamvp.com/api/accounts/signup/"
    let urlComp = URLComponents(string: todoEndpoint)
    
    guard let url = urlComp?.url else {
        return print("Error: cannot create URL")
    }
    let body = "realname=\(realname)&phoneNumber=\(phoneNumber)&email=\(email)&password=\(password)&username=\(email)".data(using: String.Encoding.utf8, allowLossyConversion: false)
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = body
    
    //URLSession 이걸 네트워크 작업.
    // escaping (비동기) completion =>
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else {
            print(error!.localizedDescription)
            return
        }
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode ,
            response.mimeType == "application/json"
            else {
                print("StatusCode is not valid")
                return
        }
        guard let data = data else {
            print("Error: did not receive data")
            return
        }
        guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String:String] else {
            print("Could not get parsed data")
            return
        }
        print(response.statusCode) // print 201 나옴.
        print("nickname",todo["nickname"])
        completion()
    }
    task.resume()
}




// 토큰 받기
func getToken(email:String, password:String, completion: @escaping (String) -> (String)) {
    let todoEndpoint = "http://yanoljamvp.com/api/email/get_token/"
    let urlComp = URLComponents(string: todoEndpoint)
    var token = ""
    guard let url = urlComp?.url else {
        print("Error: cannot create URL")
        return
    }
    // 회원가입
    let body = "email=\(email)&password=\(password)".data(using: String.Encoding.utf8, allowLossyConversion: false)
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = body
    
    //URLSession 이걸 네트워크 작업.
    // escaping (비동기) completion =>
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription)}
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode ,
            response.mimeType == "application/json"
            else { return print("StatusCode is not valid")}
        guard let data = data else {
            return print("Error: did not receive data")
        }
        guard let tokenJson = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else { return print("Could not get parsed data")}
        //        print(response.statusCode) // print 201 나옴.
        
        let tokenInfo = tokenJson["token"] as? String
        token = "Token \(tokenInfo!)"
//        print(token)
        completion(token)
    }
    task.resume()
}


