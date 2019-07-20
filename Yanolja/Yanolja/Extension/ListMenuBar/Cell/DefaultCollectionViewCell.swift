//
//  DefaultCollectionViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/18.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DefaultCollectionViewCell: UICollectionViewCell {
    
    var refreshControl = UIRefreshControl()
    
    let motelListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        self.addSubview(motelListTableView)
        motelListTableView.addSubview(refreshControl)
        
        motelListTableView.refreshControl?.addTarget(self, action: #selector(refreshList(_:)), for: .valueChanged)
        
        motelListTableView.dataSource = self
        motelListTableView.register(HotelTableViewCell.self, forCellReuseIdentifier: HotelTableViewCell.reusableIdentifier)
        motelListTableView.allowsSelection = false
        
        NSLayoutConstraint.activate([
            motelListTableView.topAnchor.constraint(equalTo: self.topAnchor),
            motelListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            motelListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            motelListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc private func refreshList(_ sender: Any) {
        motelListTableView.refreshControl?.endRefreshing()
        motelListTableView.reloadData()
    }
    
}

extension DefaultCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.reusableIdentifier, for: indexPath) as! HotelTableViewCell
        return cell
    }
    
}
