//
//  HomePopDetailViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 07/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomePopDetailViewController: UIViewController {

    // MARK: - Properties
    
    // navigationView
    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let naviTitleLabel = UILabel()
    private let navigationViewBottomLine = UIView()
    
    private let popDetailTableView = UITableView()
    
    private var popList = PopDataManager.shared.pops
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureNavigationView()
        configureTableView()
    }
    
    // MARK: - Configuration
    
    // configuration navigationView
    private func configureNavigationView() {
        navigationView.backgroundColor = .white
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        naviTitleLabel.text = "이벤트"
        naviTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        naviTitleLabel.textColor = .black
        naviTitleLabel.textAlignment = .center
        
        navigationViewBottomLine.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(navigationView)
        navigationView.addSubview(dismissButton)
        navigationView.addSubview(naviTitleLabel)
        view.addSubview(navigationViewBottomLine)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerYAnchor.constraint(equalTo: naviTitleLabel.centerYAnchor).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        naviTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        naviTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        naviTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        naviTitleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        naviTitleLabel.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        navigationViewBottomLine.translatesAutoresizingMaskIntoConstraints = false
        navigationViewBottomLine.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        navigationViewBottomLine.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor).isActive = true
        navigationViewBottomLine.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor).isActive = true
        navigationViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func configureTableView() {
    
        popDetailTableView.dataSource = self
        popDetailTableView.estimatedRowHeight = 20  // 대충의 높이값
        popDetailTableView.rowHeight = UITableView.automaticDimension
        popDetailTableView.separatorStyle = .none
        popDetailTableView.backgroundColor = #colorLiteral(red: 0.9677450061, green: 0.9726848006, blue: 0.9768208861, alpha: 1)
        
        popDetailTableView.register(HomePopDetailTableViewCell.self, forCellReuseIdentifier: HomePopDetailTableViewCell.identifier)
        
        view.addSubview(popDetailTableView)
        
        popDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        popDetailTableView.topAnchor.constraint(equalTo: navigationViewBottomLine.bottomAnchor).isActive = true
        popDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        popDetailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    
    // MARK: - Action Methods
    
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension HomePopDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = popDetailTableView.dequeueReusableCell(withIdentifier: HomePopDetailTableViewCell.identifier, for: indexPath) as! HomePopDetailTableViewCell
        
        cell.configurePopDetail(image: UIImage(named: popList[indexPath.row].imageName))
        
        return cell
    }
    
    
}
