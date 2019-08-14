//
//  HomeCategoryViewController.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeCategoryViewController: UIViewController {

   
    private let backButton = UIButton()
    let titleLabel = UILabel()
    private let regionTitleLabel = UILabel()
    private let myLocationMoveButton = UIButton(type: .system)
    
    
    
    let horizontalLineView = UIView()
    let verticalLineView = UIView()
    
    let mainRegionTableView = UITableView()
    let subRegionTableView = UITableView()
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        
    }
    func configure() {
        let temp = [backButton,titleLabel,regionTitleLabel,myLocationMoveButton,mainRegionTableView,subRegionTableView,horizontalLineView,verticalLineView]
        for x in temp {
            view.addSubview(x)
            x.translatesAutoresizingMaskIntoConstraints = false
        }
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 5).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15).isActive = true
//        titleLabel.text = "모텔"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        
        
        regionTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 40).isActive = true
        regionTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15).isActive = true
        regionTitleLabel.text = "지역선택"
        regionTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        myLocationMoveButton.lastBaselineAnchor.constraint(equalTo: regionTitleLabel.lastBaselineAnchor).isActive = true
        myLocationMoveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        myLocationMoveButton.setTitle("내주변", for: .normal)
        myLocationMoveButton.addTarget(self, action: #selector(moveToMyLocationController), for: .touchUpInside)
        
        horizontalLineView.topAnchor.constraint(equalTo: regionTitleLabel.bottomAnchor,constant: 8).isActive = true
        horizontalLineView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15).isActive = true
        horizontalLineView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -15).isActive = true
        horizontalLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLineView.backgroundColor = #colorLiteral(red: 0.9520986676, green: 0.9562036395, blue: 0.962436378, alpha: 1)
        
        
        mainRegionTableView.dataSource = self
        mainRegionTableView.delegate = self
        mainRegionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "leftCell")
        mainRegionTableView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 1).isActive = true
        mainRegionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15).isActive = true
        mainRegionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainRegionTableView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        verticalLineView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor).isActive = true
        verticalLineView.leadingAnchor.constraint(equalTo: mainRegionTableView.trailingAnchor).isActive = true
        verticalLineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        verticalLineView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        verticalLineView.backgroundColor = #colorLiteral(red: 0.9520986676, green: 0.9562036395, blue: 0.962436378, alpha: 1)
        
        
        subRegionTableView.dataSource = self
        subRegionTableView.delegate = self
        subRegionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "rightCell")
        subRegionTableView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 1).isActive = true
        subRegionTableView.leadingAnchor.constraint(equalTo: mainRegionTableView.trailingAnchor,constant: 10).isActive = true
        subRegionTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -15).isActive = true
        subRegionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func moveToMyLocationController() {
        print("눌린다")
    }
    
    var saveIndex :Int = 0
}

extension HomeCategoryViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainRegionTableView {
            return locations.count
        } else {
            return locations[saveIndex].sub.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == mainRegionTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath)
            cell.textLabel?.text = locations[indexPath.row].city
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .init(0.2))
            cell.textLabel?.textAlignment = .center
            cell.backgroundColor = #colorLiteral(red: 0.9520986676, green: 0.9562036395, blue: 0.962436378, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0.6174265742, green: 0.6253524423, blue: 0.6286900043, alpha: 1)
            let selectBackgroudView = UIView()
            selectBackgroudView.backgroundColor = .white
            cell.selectedBackgroundView = selectBackgroudView
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15,weight: .light)
            cell.textLabel?.numberOfLines = 2
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = locations[saveIndex].sub[indexPath.row]
            let selectBackgroudView = UIView()
            selectBackgroudView.backgroundColor = .white
            cell.selectedBackgroundView = selectBackgroudView
            
            return cell
        }
    }
}

extension HomeCategoryViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == mainRegionTableView {
            saveIndex = indexPath.row
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .black
            subRegionTableView.reloadData()
        } else {
            singleTon.saveRegionSearchList.removeAll()
            let vc = RegionDetailViewController()
            regionSearch(selectRegion: locations[saveIndex].sub[indexPath.row], category: titleLabel.text ?? "모텔", personnel: 2,  requestCheckIn: self.formatter.string(from: singleTon.saveDate[0])+singleTon.checkInTime, requestCheckOut: self.formatter.string(from: singleTon.saveDate[1])+singleTon.checkOutTime) {
                DispatchQueue.main.async {
                    vc.stayTableView.reloadData()
                }
            }
            
            vc.titleLabel.text = locations[saveIndex].sub[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == mainRegionTableView {
            saveIndex = indexPath.row
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 0.6174265742, green: 0.6253524423, blue: 0.6286900043, alpha: 1)
        }
    }
    
}
