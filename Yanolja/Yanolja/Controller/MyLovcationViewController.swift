//
//  MyLovcationViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class MyLovcationViewController: UIViewController {

    var topNaviCell = TopNaviCell()
    let ListView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        configureViewComponents()
    }
    
    private func configureViewComponents() {
        view.addSubview(topNaviCell)
        topNaviCell.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            topNaviCell.topAnchor.constraint(equalTo: guide.topAnchor),
            topNaviCell.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topNaviCell.widthAnchor.constraint(equalTo: guide.widthAnchor),
            topNaviCell.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}
