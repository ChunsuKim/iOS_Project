//
//  FilterViewController.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let removeAllButton = UIButton()
    private let horizontalView = UIView()
    
    private let filterTableView = UITableView()
    private let resultButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
        
    }
    
    private func makeUI() {
        let tempArr = [backButton,titleLabel,removeAllButton,horizontalView,filterTableView,resultButton]
        tempArr.forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.text = "필터"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        removeAllButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        removeAllButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -15).isActive = true
        removeAllButton.setTitle("초기화", for: .normal)
        removeAllButton.setTitleColor(.gray, for: .normal)
        removeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        removeAllButton.addTarget(self, action: #selector(resetAction), for: .touchUpInside)

        horizontalView.topAnchor.constraint(equalTo: removeAllButton.bottomAnchor,constant: 5).isActive = true
        horizontalView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 5).isActive = true
        horizontalView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -5).isActive = true
        horizontalView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalView.backgroundColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        
        filterTableView.topAnchor.constraint(equalTo: horizontalView.bottomAnchor).isActive = true
        filterTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        filterTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        filterTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -60).isActive = true
        filterTableView.dataSource = self
        filterTableView.register(FilterSortCell.self, forCellReuseIdentifier: "sort")
        filterTableView.register(FilterThemeCell.self, forCellReuseIdentifier: "theme")
        filterTableView.register(FilterCharacteristicCell.self, forCellReuseIdentifier: "characteristic")
        filterTableView.register(FilterPriceCell.self, forCellReuseIdentifier: "price")

        
        
        
        resultButton.topAnchor.constraint(equalTo: filterTableView.bottomAnchor).isActive = true
        resultButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        resultButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        resultButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        resultButton.setTitle("필터적용", for: .normal)
        resultButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        resultButton.backgroundColor = #colorLiteral(red: 0.9797077775, green: 0.07226980478, blue: 0.4098213315, alpha: 1)
        resultButton.layer.cornerRadius = 8
        
        resultButton.addTarget(self, action: #selector(adaptFilter), for: .touchUpInside)

    }
    @objc func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc func resetAction() {
        print(1)
        if let filterCell = filterTableView.cellForRow(at: [0,0]) as? FilterSortCell{
            filterCell.initButtonAction()
        }
        if let filterThemeCell = filterTableView.cellForRow(at: [0,1]) as? FilterThemeCell {
            for x in 0...15 {
                if let CollectionViewCell = filterThemeCell.collectionView.cellForItem(at: [0,x]) as? FilterThemeCollectionViewCell {
                    CollectionViewCell.button.isSelected = false
                    
                }
            }
            filterThemeCell.count = 0
            filterThemeCell.collectionView.reloadData()
        }
        if let filterCharacterCell = filterTableView.cellForRow(at: [0,2]) as? FilterCharacteristicCell {
            filterCharacterCell.lowerPriceButton.isSelected = false
            filterCharacterCell.goodStayButton.isSelected = false
        }
        if let filterPriceCell = filterTableView.cellForRow(at: [0,3]) as? FilterPriceCell {
            filterPriceCell.slider.value = filterPriceCell.slider.maximumValue
        }
        
    }
    @objc func adaptFilter() {
        if let vc = presentingViewController as? MyLocationViewController {
            
            vc.listCollectionView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sort", for: indexPath) as! FilterSortCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "theme", for: indexPath) as! FilterThemeCell

            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "characteristic", for: indexPath) as! FilterCharacteristicCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "price", for: indexPath) as! FilterPriceCell
            return cell
        }
        
    }
    
    
}
