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
    let notiCenter = NotificationCenter.default
    var cnt = 0
    var listCount = 0
    
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
    var hotelSaveList: [StayListElement] = []
    var gestSaveList: [StayListElement] = []
    var pension: [StayListElement] = []
    
    func configureObject(data: [StayListElement]) {
        saveStayList = data
        
//        for i in 0 ... saveStayList.map({$0.category}).count {
//            if saveStayList[i].category.rawValue == "호텔리조트" {
//                hotelSaveList.append(saveStayList[i])
//            } else if saveStayList[i].category.rawValue == "펜션풀빌라" {
//                pension.append(saveStayList[i])
//            } else if saveStayList[i].category.rawValue == "게스트하우스" {
//                gestSaveList.append(saveStayList[i])
//            }
//        }
        
        motelListTableView.reloadData()
    }
    
    private func configureTableView() {
        self.addSubview(topBandNavi)
        self.addSubview(motelListTableView)
        topBandNavi.addSubview(bandNaviButton)
        motelListTableView.addSubview(refreshControl)
        
        motelListTableView.refreshControl?.addTarget(self, action: #selector(refreshList(_:)), for: .valueChanged)
        
        motelListTableView.delegate = self
        motelListTableView.dataSource = self
        motelListTableView.register(HotelTableViewCell.self, forCellReuseIdentifier: HotelTableViewCell.reusableIdentifier)
        motelListTableView.allowsSelection = true
        
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
    
    // MARK: - @objc
    
    @objc private func refreshList(_ sender: Any) {
        motelListTableView.refreshControl?.endRefreshing()
        motelListTableView.reloadData()
    }
    
}

extension DefaultCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        notiCenter.post(name: Notification.Name("moveDetailVC"), object: nil)
    }
}

extension DefaultCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 해당 카테고리의 카운트 개수
//        var test = saveStayList.filter({ $0.category.rawValue == "호텔" })
//        hotelSaveList.append(test)
//        print("@@@@@ :", saveStayList.filter({ $0.category.rawValue == "호텔" }))
        
//        print("@#### :", hotelSaveList.count)
        
        return listCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = saveStayList[indexPath.row]
        let category = data.category
        
        switch category {
        case .호텔리조트:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.reusableIdentifier, for: indexPath) as! HotelTableViewCell
            cell.selectionStyle = .none
            cell.configureObject(data: hotelSaveList[indexPath.row])
            /// VIEW ->
            tableView.reloadData()
            
            return cell
        case .펜션풀빌라:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.reusableIdentifier, for: indexPath) as! HotelTableViewCell
            cell.selectionStyle = .none
            cell.configureObject(data: pension[indexPath.row])
            /// VIEW ->
            
            return cell
        case .게스트하우스:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.reusableIdentifier, for: indexPath) as! HotelTableViewCell
            cell.selectionStyle = .none
            cell.configureObject(data: gestSaveList[indexPath.row])
            /// VIEW ->
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
}
