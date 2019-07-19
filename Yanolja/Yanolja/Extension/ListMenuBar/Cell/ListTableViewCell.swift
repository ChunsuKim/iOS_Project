//
//  ListTableViewController.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/17.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ListTableViewCell: UICollectionViewCell {
    
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
        
        motelListTableView.dataSource = self
        motelListTableView.register(MotelTableViewCell.self, forCellReuseIdentifier: MotelTableViewCell.identifier)
        motelListTableView.allowsSelection = false
        motelListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        NSLayoutConstraint.activate([
            motelListTableView.topAnchor.constraint(equalTo: self.topAnchor),
            motelListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            motelListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            motelListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

}

extension ListTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...5:
            let cell = tableView.dequeueReusableCell(withIdentifier: MotelTableViewCell.identifier, for: indexPath) as! MotelTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.reusableIdentifier, for: indexPath) as! HotelTableViewCell
            return cell
        }
    }
    
}
