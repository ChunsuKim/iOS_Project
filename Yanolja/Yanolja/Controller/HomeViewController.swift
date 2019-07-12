//
//  HomeViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    // HeaderView
    private let headerView = UIView()
    private let headerImageView = UIImageView()
    private let headerSearchLabel = UILabel()
    private let headerSearchImageView = UIImageView()
    
    // TableView
    private let homeTableView = UITableView()
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        configureHeaderView()
        configureTableView()
        
        configureHeaderViewConstraints()
        configureTableViewConstraints()
    }
    
    // MARK: - Configuration User Interface
    
    // configuration HeaderView
    private func configureHeaderView() {
        headerView.backgroundColor = #colorLiteral(red: 0.9677450061, green: 0.9726848006, blue: 0.9768208861, alpha: 1)
        
        headerImageView.image = UIImage(named: "logob")
        headerImageView.contentMode = .scaleAspectFit
        
        headerSearchLabel.backgroundColor = .white
        headerSearchLabel.layer.cornerRadius = 17
        headerSearchLabel.clipsToBounds = true
        headerSearchLabel.text = "    어디로 놀러갈까요?"
        headerSearchLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        headerSearchLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        headerSearchImageView.image = UIImage(named: "grasses")
        headerSearchImageView.contentMode = .scaleAspectFill
        
        view.addSubview(headerView)
        headerView.addSubview(headerImageView)
        headerView.addSubview(headerSearchLabel)
        headerSearchLabel.addSubview(headerSearchImageView)
        
    }
    
    // configuration TableView
    private func configureTableView() {
        homeTableView.dataSource = self
        homeTableView.estimatedRowHeight = 50  // 대충의 높이값
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.allowsSelection = false
        homeTableView.separatorStyle = .none
        
        homeTableView.register(HomeTopButtonTableViewCell.self, forCellReuseIdentifier: HomeTopButtonTableViewCell.identifier)
        
        homeTableView.register(HomeThemeTableViewCell.self, forCellReuseIdentifier: HomeThemeTableViewCell.identifier)
        
        
        view.addSubview(homeTableView)
    }
    
    // MARK: - Configuration Constraints
    
    // HeaderView Constraints
    private func configureHeaderViewConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        headerImageView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor).isActive = true
        headerImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        headerImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerSearchLabel.translatesAutoresizingMaskIntoConstraints = false
        headerSearchLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 10).isActive = true
        headerSearchLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        headerSearchLabel.centerYAnchor.constraint(equalTo: headerImageView.centerYAnchor).isActive = true
        headerSearchLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        headerSearchImageView.translatesAutoresizingMaskIntoConstraints = false
        headerSearchImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        headerSearchImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        headerSearchImageView.centerYAnchor.constraint(equalTo: headerSearchLabel.centerYAnchor).isActive = true
        headerSearchImageView.trailingAnchor.constraint(equalTo: headerSearchLabel.trailingAnchor, constant: -10).isActive = true
    }
    
    // TableView Constraints
    private func configureTableViewConstraints() {
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - TableView Data Source Extension
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopButtonTableViewCell.identifier, for: indexPath) as! HomeTopButtonTableViewCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeThemeTableViewCell.identifier, for: indexPath) as! HomeThemeTableViewCell
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}


