//
//  FilterViewController.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let removeAllButton = UIButton()
    
    private let filterTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
    }
    
    private func makeUI() {
        let tempArr = [backButton,titleLabel,removeAllButton,filterTableView]
        tempArr.forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.text = "필터"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        removeAllButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        removeAllButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -15).isActive = true
        removeAllButton.setTitle("초기화", for: .normal)
        removeAllButton.setTitleColor(.gray, for: .normal)
        removeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)

        filterTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 5).isActive = true
        
        
    }

}
