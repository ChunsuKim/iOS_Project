//
//  RoomDetailViewController.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RoomDetailViewController: UIViewController {

    // MARK: - Properites
    let customTab = CustomTabBarController()
    
    let topNaviCustom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let divideBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 0.5)
        
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = #imageLiteral(resourceName: "back").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(backEvent(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let stayNaviTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "객실상세"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = #imageLiteral(resourceName: "share").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    let roomDetailView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        
        return table
    }()
    
    let reservationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        view.backgroundColor = .white
        
        return view
    }()
    
    let rentableReservation: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("대실 예약하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.1803921569, blue: 0.3725490196, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let stayReservation: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("숙박 예약하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.1803921569, blue: 0.3725490196, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(stayReservation(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(reservationView)
        reservationView.addSubview(rentableReservation)
        reservationView.addSubview(stayReservation)
        
        configureTopNavi()
        configureRoomDetail()
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        customTab.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        customTab.tabBar.isHidden = false
    }
    
    private func configureTopNavi() {
        view.addSubview(topNaviCustom)
        topNaviCustom.addSubview(divideBorder)
        topNaviCustom.addSubview(backButton)
        topNaviCustom.addSubview(stayNaviTitle)
        topNaviCustom.addSubview(shareButton)
    }
    
    private func configureRoomDetail() {
        view.addSubview(roomDetailView)
        
        roomDetailView.dataSource = self
        
        roomDetailView.register(RoomInfoTableViewCell.self, forCellReuseIdentifier: RoomInfoTableViewCell.reusableIdentifier)
        roomDetailView.register(DetailRoomImageTableViewCell.self, forCellReuseIdentifier: DetailRoomImageTableViewCell.reusableIdentifier)
        roomDetailView.register(CheckInOutTableViewCell.self, forCellReuseIdentifier: CheckInOutTableViewCell.reusableIdentifier)
        roomDetailView.register(ReservationButtonviewTableViewCell.self, forCellReuseIdentifier: ReservationButtonviewTableViewCell.reusableIdentifier)
        roomDetailView.register(ReservationNoticeTableViewCell.self, forCellReuseIdentifier: ReservationNoticeTableViewCell.reusableIdentifier)
    }
    
    // MARK: - Configure Constraints
    private func configureConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            topNaviCustom.topAnchor.constraint(equalTo: view.topAnchor),
            topNaviCustom.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topNaviCustom.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            topNaviCustom.heightAnchor.constraint(equalToConstant: 100),
            backButton.leadingAnchor.constraint(equalTo: topNaviCustom.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: topNaviCustom.bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            stayNaviTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            stayNaviTitle.centerXAnchor.constraint(equalTo: topNaviCustom.centerXAnchor),
            stayNaviTitle.heightAnchor.constraint(equalToConstant: 20),
            stayNaviTitle.widthAnchor.constraint(equalTo: topNaviCustom.widthAnchor, multiplier: 0.3),
            shareButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: topNaviCustom.trailingAnchor, constant: -20),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20),
            divideBorder.bottomAnchor.constraint(equalTo: topNaviCustom.bottomAnchor),
            divideBorder.leadingAnchor.constraint(equalTo: topNaviCustom.leadingAnchor),
            divideBorder.widthAnchor.constraint(equalTo: topNaviCustom.widthAnchor),
            divideBorder.heightAnchor.constraint(equalToConstant: 1),
            
            roomDetailView.topAnchor.constraint(equalTo: topNaviCustom.bottomAnchor),
            roomDetailView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            roomDetailView.bottomAnchor.constraint(equalTo: reservationView.topAnchor),
            roomDetailView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            reservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            reservationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            reservationView.heightAnchor.constraint(equalToConstant: 100),
            
            rentableReservation.topAnchor.constraint(equalTo: reservationView.topAnchor, constant: 5),
            rentableReservation.leadingAnchor.constraint(equalTo: reservationView.leadingAnchor, constant: 10),
            rentableReservation.bottomAnchor.constraint(equalTo: reservationView.bottomAnchor, constant: -35),
            rentableReservation.widthAnchor.constraint(equalTo: reservationView.widthAnchor, multiplier: 0.5, constant: -12.5),
            rentableReservation.trailingAnchor.constraint(equalTo: stayReservation.leadingAnchor, constant: -5),
            stayReservation.topAnchor.constraint(equalTo: rentableReservation.topAnchor),
            stayReservation.bottomAnchor.constraint(equalTo: rentableReservation.bottomAnchor),
            stayReservation.widthAnchor.constraint(equalTo: rentableReservation.widthAnchor),
            stayReservation.trailingAnchor.constraint(equalTo: reservationView.trailingAnchor, constant: -10),
        ])
    }

    // MARK: - Action Method
    @objc private func backEvent(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func stayReservation(_ sender: UIButton) {
        present(ReservationViewController(), animated: true)
    }
}

extension RoomDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomInfoTableViewCell.reusableIdentifier, for: indexPath) as! RoomInfoTableViewCell
            cell.title.text = "Standard mini"
            cell.hotelName.text = "선릉 호텔 발리"
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailRoomImageTableViewCell.reusableIdentifier, for: indexPath) as! DetailRoomImageTableViewCell
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckInOutTableViewCell.reusableIdentifier, for: indexPath) as! CheckInOutTableViewCell
            cell.checkInDate.text = "7월 26일(금)"
            cell.checkOutDate.text = "7월 26일(금)"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReservationButtonviewTableViewCell.reusableIdentifier, for: indexPath) as! ReservationButtonviewTableViewCell
            cell.hoursAvailableCont.text = "최대 \(5)시간"
            cell.opertationTimeCont.text = "13:00 ~ 22:00"
            cell.defaultRentablePrice.text = "30000원"
            cell.rentablePrice.text = "25000"
            
            cell.checkInCont.text = "15:00 부터"
            cell.checkOutCont.text = "14:00 까지"
            cell.defaultStayPrice.text = "70000원"
            cell.stayPrice.text = "48000"
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReservationNoticeTableViewCell.reusableIdentifier, for: indexPath) as! ReservationNoticeTableViewCell
            
            return cell
        default:
            let cell = UITableViewCell()
            
            return cell
        }
    }
}
