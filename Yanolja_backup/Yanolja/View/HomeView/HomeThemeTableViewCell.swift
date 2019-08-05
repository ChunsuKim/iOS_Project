//
//  HomeEventTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 09/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeThemeTableViewCell"
    
    // TitleView
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let titleButton = UIButton(type: .custom)
    private let menuBar = HomeThemeCollectionViewMenuBar()
    
    private var homeThemeCollectionViewCell = HomeThemeCollectionViewCell()
    private var isState = true
    private var poolList = themeMenus[0].items
    private var poolListDiff = themeMenusDiff[0].items
    
    private var groups = [HomeThemeGroup]()
    
    // CollectionView
    private let homeViewCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        menuBar.delegate = self
        
        configureTitleView()
        configureMenuBar()
        configureCollectionView()
        configureTitleViewConstraints()
        configureCollectionViewConstraints()
        
        fetchData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchBigSale { (dataGroup, error) in
            dispatchGroup.leave()
            self.groups = dataGroup ?? []
//            print("dataGroup:", dataGroup)
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchPartyRoom { (dataGroup, error) in
            dispatchGroup.leave()
            self.groups = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchSwimmingPool { (dataGroup, error) in
            dispatchGroup.leave()
            self.groups = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchSpa { (dataGroup, error) in
            dispatchGroup.leave()
            self.groups = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - Configuration
    
    // configuration titleView
    private func configureTitleView() {
        
        titleView.backgroundColor = .white
        
        titleLabel.text = "첨벙첨벙 물놀이하러 Go!"
        titleLabel.textAlignment = .left
        titleLabel.textColor = #colorLiteral(red: 0.1794605851, green: 0.184564501, blue: 0.1800470352, alpha: 1)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        titleButton.setImage(#imageLiteral(resourceName: "titleButton"), for: .normal)
        titleButton.contentMode = .scaleAspectFit
        
        contentView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(titleButton)
    }
    
    // configuration menuBar(CollectionView)
    private func configureMenuBar() {
        contentView.addSubview(menuBar)
        
        menuBar.menuCollectionView.register(HomeThemeMenuCollectionCell.self, forCellWithReuseIdentifier: HomeThemeMenuCollectionCell.identifier)
        
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    // configuration collectionView
    private func configureCollectionView() {
        
        homeViewCollectionView.dataSource = self
        homeViewCollectionView.delegate = self
        homeViewCollectionView.isScrollEnabled = false
        
        homeViewCollectionView.register(HomeThemeCollectionViewCell.self, forCellWithReuseIdentifier: HomeThemeCollectionViewCell.identifier)
        
        contentView.addSubview(homeViewCollectionView)
    }
    
    // MARK: - Configuration Constraints
    
    // constraints TitleView
    private func configureTitleViewConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: titleButton.leadingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        titleButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -20).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        titleButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
    
    // constraints CollectionView
    private func configureCollectionViewConstraints() {
        homeViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        homeViewCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        homeViewCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        homeViewCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        homeViewCollectionView.heightAnchor.constraint(equalToConstant: 430).isActive = true
        homeViewCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    // MARK: - reload global methods
    
    func reloadCollectionView() {
        isState.toggle()
        homeViewCollectionView.reloadData()
    }
    
    func reloadMenuBar() {
        menuBar.reloadMenuCollectionView()
    }
    
    func reloadTitleLabel() {
        if isState {
            titleLabel.text = themeTitle
        } else {
            titleLabel.text = themeTitleDiff
        }
    }
    
    func reloadTitleButton() {
        if isState {
            titleButton.setImage(UIImage(named: "titleButton"), for: .normal)
        } else {
            titleButton.setImage(UIImage(named: "titleButtonDiff"), for: .normal)
        }
    }
}

// MARK: - CollectionView Data Source Extension
extension HomeThemeTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(groups.count)
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThemeCollectionViewCell.identifier, for: indexPath) as! HomeThemeCollectionViewCell
        
        if isState {
            
            let themeGroup = groups[indexPath.item]
            cell.configureCellContent(image: themeGroup.mainImage, title: themeGroup.stay, price: themeGroup.saleDaysPrice)
            
            print(themeGroup.stay)
//            cell.configureCellContent(image: UIImage(named: poolList[indexPath.row].imageUrl), title: poolList[indexPath.row].title, price: poolList[indexPath.row].price)
            
            homeThemeCollectionViewCell = cell
        } else {
//            cell.configureCellContent(image: UIImage(named: poolListDiff[indexPath.row].imageName), title: poolListDiff[indexPath.row].title, price: poolListDiff[indexPath.row].price)
            
            homeThemeCollectionViewCell = cell
        }
        
        return cell
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension HomeThemeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.maxX * 0.43, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
}

// MARK: - HomeThemeCollectionViewMenuBar Delegate
extension HomeThemeTableViewCell: MenuBarDelegate {
    func menuBarDidSelected(_ indexPath: IndexPath) {
        homeViewCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        
//        poolList = themeMenus[indexPath.row].items
//        poolListDiff = themeMenusDiff[indexPath.row].items
        homeViewCollectionView.reloadData()
    }
}
