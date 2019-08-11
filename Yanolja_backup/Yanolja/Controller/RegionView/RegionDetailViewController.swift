//
//  RegionDetailViewController.swift
//  Yanolja
//
//  Created by brian은석 on 07/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RegionDetailViewController: UIViewController {
    let backButton = UIButton()
    let homeViewButton = UIButton()
    let searchViewButton = UIButton()
    let titleView = UIView()
    let titleLabel = UILabel()
    let calendarButton = UIButton()
    let numberOfPeopleButton = UIButton()
    let segMentView = UIView()
    let stayTableView = UITableView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
//        saveTodayInSingleTon()
        
    }
    private func makeView() {
        let tempArr = [backButton,homeViewButton,searchViewButton,titleView,calendarButton,numberOfPeopleButton,segMentView,stayTableView]
        tempArr.forEach{view.addSubview($0);$0.translatesAutoresizingMaskIntoConstraints = false}
        let leadingConstant:CGFloat = 15
        let widthHeightConstant:CGFloat = 21
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leadingConstant).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        searchViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        searchViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -leadingConstant).isActive = true
        searchViewButton.widthAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        searchViewButton.heightAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        searchViewButton.setImage(#imageLiteral(resourceName: "grasses"), for: .normal)
        
        
        homeViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        homeViewButton.trailingAnchor.constraint(equalTo: searchViewButton.leadingAnchor,constant: -30).isActive = true
        homeViewButton.widthAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        homeViewButton.heightAnchor.constraint(equalToConstant: widthHeightConstant).isActive = true
        homeViewButton.setImage(#imageLiteral(resourceName: "homed"), for: .normal)
        homeViewButton.addTarget(self, action: #selector(moveToHomeView), for: .touchUpInside)
        
        titleView.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 5).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leadingConstant).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -leadingConstant).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleView.backgroundColor = #colorLiteral(red: 0.9555117488, green: 0.9596166015, blue: 0.9658421874, alpha: 1)
        titleView.layer.masksToBounds = true
        titleView.layer.cornerRadius = 25
        
        
        titleView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor,constant: leadingConstant).isActive = true
        titleLabel.backgroundColor = #colorLiteral(red: 0.9555117488, green: 0.9596166015, blue: 0.9658421874, alpha: 1)
        //        titleLabel.text = "강남역"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        calendarButton.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 15).isActive = true
        calendarButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leadingConstant).isActive = true
        calendarButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        calendarButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        calendarButton.layer.borderWidth = 2
        calendarButton.layer.borderColor = #colorLiteral(red: 0.9555117488, green: 0.9596166015, blue: 0.9658421874, alpha: 1)
        calendarButton.layer.masksToBounds = true
        calendarButton.layer.cornerRadius = 20
        calendarButton.setTitle(singleTon.todayString+"~"+singleTon.tomorrowString+",1박", for: .normal)
        calendarButton.setTitleColor(.black, for: .normal)
        calendarButton.titleLabel?.font = UIFont.systemFont(ofSize: 12,weight: .ultraLight)
        
        calendarButton.addTarget(self, action: #selector(calendarPresent), for: .touchUpInside)
        
        numberOfPeopleButton.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 15).isActive = true
        numberOfPeopleButton.leadingAnchor.constraint(equalTo: calendarButton.trailingAnchor,constant: 10).isActive = true
        numberOfPeopleButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        numberOfPeopleButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        numberOfPeopleButton.setTitle("성인\(singleTon.adultCount), 아동\(singleTon.childCount)", for: .normal)
        numberOfPeopleButton.titleLabel?.font = UIFont.systemFont(ofSize: 13,weight: .ultraLight)
        
        numberOfPeopleButton.layer.borderWidth = 2
        numberOfPeopleButton.layer.borderColor = #colorLiteral(red: 0.9555117488, green: 0.9596166015, blue: 0.9658421874, alpha: 1)
        numberOfPeopleButton.setTitleColor(.black, for: .normal)
        numberOfPeopleButton.layer.masksToBounds = true
        numberOfPeopleButton.layer.cornerRadius = 20
        numberOfPeopleButton.titleLabel?.font = UIFont.systemFont(ofSize: 14,weight: .ultraLight)
        
        segMentView.topAnchor.constraint(equalTo: calendarButton.bottomAnchor,constant: 30).isActive = true
        segMentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segMentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        segMentView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        segMentView.backgroundColor = #colorLiteral(red: 0.9555117488, green: 0.9596166015, blue: 0.9658421874, alpha: 1)
        
        stayTableView.topAnchor.constraint(equalTo: segMentView.bottomAnchor,constant: 2).isActive = true
        stayTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stayTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stayTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stayTableView.register(MotelTableViewCell.self, forCellReuseIdentifier: MotelTableViewCell.identifier)
        stayTableView.register(SearchDetailDefaultTableViewCell.self, forCellReuseIdentifier: "default")
        
        stayTableView.dataSource = self
    }
//    private func saveTodayInSingleTon() {
//        let today = Date()
//        singleTon.saveDate.append(today)
//        singleTon.saveDate.append(today+86400)
//    }
    @objc private func moveToHomeView() {
//        guard let homeViewTabBarController = presentingViewController?.presentingViewController as? CustomTabBarController else {return print("homeView 못뜸..ㅠㅠ")}
//        homeViewTabBarController.dismiss(animated: true, completion: nil)
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func calendarPresent() {
        let vc = CalendarViewController()
        present(vc, animated: true, completion: nil)
    }
    
}


extension RegionDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if singleTon.saveRegionSearchList.count == 0 {
            return 1
        } else {
            return singleTon.saveRegionSearchList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if singleTon.saveRegionSearchList.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
            tableView.rowHeight = tableView.frame.height
            
            return cell
        } else {
            tableView.rowHeight = UITableView.automaticDimension

            let cell = tableView.dequeueReusableCell(withIdentifier: MotelTableViewCell.identifier, for: indexPath) as! MotelTableViewCell
            let data = singleTon.saveRegionSearchList[indexPath.row]
            cell.puts(mainImage: data.mainImage, stay: data.stay, averageGrade: data.averageGrade, totalComments: data.totalComments, ownerComments: data.ownerComments, directions: data.directions, hoursAvailable: data.hoursAvailable, daysPrice: data.daysPrice, saleDaysPrice: data.saleDaysPrice)
            return cell
        }
    }
    
    
    
}
