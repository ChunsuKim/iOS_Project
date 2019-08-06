//
//  ParsingTimeViewController.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/02.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ParsingTimeViewController: UIViewController {

    let imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configure()
    }
    private let images = [
        "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files" ].compactMap{UIImage.init(named:$0)}
    
    private func configure() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.backgroundColor = .yellow
        imageView.animationImages = images
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 5
        imageView.startAnimating()
    }

}
