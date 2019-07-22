//
//  ViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {

    let titleLabel = UILabel()
    let searchButton = UIButton()
    
    
    private let regionButton = UIButton()
    private let stationButton = UIButton()
    private let mapButton = UIButton()
    private let barView = UIView()
    private var barLeading :NSLayoutConstraint!
    
    let horizontalLineView = UIView()
    let verticalLineView = UIView()
    
    let mainRegionTableView = UITableView()
    let subRegionTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        configure()
        tapUI()
        
        
    }
    func configure() {
        let temp = [titleLabel,searchButton,regionButton,stationButton,mapButton,mainRegionTableView,subRegionTableView,barView,horizontalLineView,verticalLineView]
        for x in temp {
            view.addSubview(x)
            x.translatesAutoresizingMaskIntoConstraints = false
        }

        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 25).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.text = "지역"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        
        searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 25).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -15).isActive = true
        searchButton.setImage(UIImage(named: "grasses"), for: .normal)
        searchButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        regionButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 25).isActive = true
        regionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 55).isActive = true
        
        stationButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 25).isActive = true
        stationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        mapButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 25).isActive = true
        mapButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -55).isActive = true
        
        
        barView.topAnchor.constraint(equalTo: stationButton.bottomAnchor, constant: 5).isActive = true
        barLeading = barView.leadingAnchor.constraint(equalTo: regionButton.leadingAnchor)
        barLeading.isActive = true
        barView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        barView.backgroundColor = .black
       let barViewWidth = barView.widthAnchor.constraint(equalTo: regionButton.widthAnchor)
        barViewWidth.priority = .defaultLow
        barViewWidth.isActive = true
        
        horizontalLineView.topAnchor.constraint(equalTo: barView.bottomAnchor,constant: 9).isActive = true
        horizontalLineView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        horizontalLineView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        horizontalLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLineView.backgroundColor = #colorLiteral(red: 0.8936626315, green: 0.8977844715, blue: 0.900680244, alpha: 1)

        
        mainRegionTableView.dataSource = self
        mainRegionTableView.delegate = self
        mainRegionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "leftCell")
        mainRegionTableView.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10).isActive = true
        mainRegionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainRegionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainRegionTableView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        verticalLineView.topAnchor.constraint(equalTo: barView.bottomAnchor,constant: 9).isActive = true
        verticalLineView.leadingAnchor.constraint(equalTo: mainRegionTableView.trailingAnchor).isActive = true
        verticalLineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        verticalLineView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        verticalLineView.backgroundColor = #colorLiteral(red: 0.9520986676, green: 0.9562036395, blue: 0.962436378, alpha: 1)
        
        
        subRegionTableView.dataSource = self
        subRegionTableView.delegate = self
        subRegionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "rightCell")
        subRegionTableView.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10).isActive = true
        subRegionTableView.leadingAnchor.constraint(equalTo: mainRegionTableView.trailingAnchor,constant: 10).isActive = true
        subRegionTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        subRegionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    private func tapUI() {
        regionButton.isSelected = true
        regionButton.setTitle("지역별", for: .normal)
        regionButton.setTitleColor(.lightGray, for: .normal)
        regionButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        regionButton.setTitleColor(.darkGray, for: .selected)
        regionButton.setTitle("지역별", for: .selected)
        regionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        
        
        stationButton.setTitle("역주변", for: .normal)
        stationButton.setTitleColor(.lightGray, for: .normal)
        stationButton.setTitle("역주변", for: .selected)
        stationButton.setTitleColor(.darkGray, for: .selected)
        stationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        stationButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        
        
        mapButton.setTitle("지도검색", for: .normal)
        mapButton.setTitleColor(.lightGray, for: .normal)
        mapButton.setTitle("지도검색", for: .selected)
        mapButton.setTitleColor(.darkGray, for: .selected)
        mapButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        mapButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
    }
    @objc private func infor(sender:UIButton) {
        regionButton.isSelected = false
        stationButton.isSelected = false
        mapButton.isSelected = false
        sender.isSelected.toggle()
     let barViewWidth = barView.widthAnchor.constraint(equalTo: sender.widthAnchor)
        
        UIView.animate(withDuration: 0.2) {
            self.barLeading.constant = sender.frame.minX - self.regionButton.frame.minX
            barViewWidth.isActive = true
            self.view.layoutIfNeeded()
            
        }
    }
 
    
   
    
    var saveIndex :Int = 0
}

extension RegionViewController :UITableViewDataSource {
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

extension RegionViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == mainRegionTableView {
           saveIndex = indexPath.row
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .black
            subRegionTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == mainRegionTableView {
            saveIndex = indexPath.row
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 0.6174265742, green: 0.6253524423, blue: 0.6286900043, alpha: 1)
        }
    }
    
}
