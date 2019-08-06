//
//  ImageView.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/02.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

extension UIImageView {
    func downloadImageFrom(_ link:String, contentMode: UIView.ContentMode) {
        guard let url = URL(string: link) else {return print("link 가 없어서 함수에서 guard 문에 걸린듯?")}
        URLSession.shared.dataTask( with: url, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
