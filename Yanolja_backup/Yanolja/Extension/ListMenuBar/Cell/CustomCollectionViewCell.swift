//
//  ListTableViewController.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/17.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var refreshControl: UIRefreshControl!
    let notiCenter = NotificationCenter.default
    let detailVC = DetailViewController()
    
    let topBandNavi: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        return view
    }()
    
    let bandNaviButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("야놀자 추천순", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.imageView?.image = #imageLiteral(resourceName: "downArrow")
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return button
    }()
    
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
    var saveStayList: [StayListElement] = []
    
    func configureObject(data: [StayListElement]) {
        saveStayList = data
        
        motelListTableView.reloadData()
    }
    
    private func configureTableView() {
        self.addSubview(topBandNavi)
        self.addSubview(motelListTableView)
        topBandNavi.addSubview(bandNaviButton)
        refreshControl = UIRefreshControl()
        motelListTableView.addSubview(refreshControl)
        
        motelListTableView.refreshControl?.addTarget(self, action: #selector(refreshList(_:)), for: .valueChanged)
        
        motelListTableView.delegate = self
        motelListTableView.dataSource = self
        motelListTableView.register(MotelTableViewCell.self, forCellReuseIdentifier: MotelTableViewCell.identifier)
        motelListTableView.register(HotelTableViewCell.self, forCellReuseIdentifier: HotelTableViewCell.reusableIdentifier)
        motelListTableView.allowsSelection = true
        motelListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        NSLayoutConstraint.activate([
            topBandNavi.topAnchor.constraint(equalTo: self.topAnchor),
            topBandNavi.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topBandNavi.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topBandNavi.bottomAnchor.constraint(equalTo: motelListTableView.topAnchor),
            topBandNavi.heightAnchor.constraint(equalToConstant: 40),
            bandNaviButton.centerYAnchor.constraint(equalTo: topBandNavi.centerYAnchor),
            bandNaviButton.trailingAnchor.constraint(equalTo: topBandNavi.trailingAnchor, constant: -20),
            motelListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            motelListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            motelListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    @objc private func refreshList(_ sender: Any) {
        
    }
    
}

extension CustomCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        notiCenter.post(name: Notification.Name("moveDetailVC"), object: nil)
//        detailVC.stayID = saveStayList[indexPath.row].stayID
        singleTon.stayID = saveStayList[indexPath.row].stayID
        print("@@@@@ :", singleTon.stayID)
    }
}

extension CustomCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveStayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = saveStayList[indexPath.row]
        let category = data.category
        
        switch category {
        case .모텔:
            let cell = tableView.dequeueReusableCell(withIdentifier: MotelTableViewCell.identifier, for: indexPath) as! MotelTableViewCell
            cell.selectionStyle = .none
            cell.configureObject(data: data)
            /// VIEW ->
            
            return cell
        case .호텔리조트:
            print("##### :", data.stay)
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.reusableIdentifier, for: indexPath) as! HotelTableViewCell
            cell.selectionStyle = .none
            cell.configureObject(data: data)
            /// VIEW ->
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
}
