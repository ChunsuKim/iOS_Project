//
//  MyLovcationViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class MyLocationViewController: UIViewController {

    var topNaviView = TopNaviView()
    let motelListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red

        navigationController?.isNavigationBarHidden = true
        
        configureViewComponents()
    }
    
    private func configureViewComponents() {
        view.addSubview(topNaviView)
        view.addSubview(motelListTableView)
        
        motelListTableView.dataSource = self
        motelListTableView.register(MotelTableViewCell.self, forCellReuseIdentifier: MotelTableViewCell.identifier)
        
        topNaviView.delegate = self
        
        topNaviView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            topNaviView.topAnchor.constraint(equalTo: guide.topAnchor),
            topNaviView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topNaviView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            motelListTableView.topAnchor.constraint(equalTo: topNaviView.bottomAnchor),
            motelListTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            motelListTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            motelListTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
        
    }
    
}

extension MyLocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MotelTableViewCell.identifier, for: indexPath) as! MotelTableViewCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MotelTableViewCell.identifier, for: indexPath) as! MotelTableViewCell
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
}

extension MyLocationViewController: checkBoxDelegate {
    func possibleChkButton() {
        if topNaviView.possibleChkButton.isSelected == false {
            topNaviView.possibleChkButton.isSelected = true
        } else {
            topNaviView.possibleChkButton.isSelected = false
        }
    }
    
    func searchButton() {
        let vc = SearchController()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
}
