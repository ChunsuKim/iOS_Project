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
    
    enum ThemeCategory: Int {
        case bigSale = 0
        case partyRoom
        case swimmingPool
        case spa
    }
    
    static let identifier = "HomeThemeTableViewCell"
    
    // TitleView
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let titleButton = UIButton(type: .custom)
    private let menuBar = HomeThemeCollectionViewMenuBar()
    
    private var homeThemeCollectionViewCell = HomeThemeCollectionViewCell()
    private var isState = true
//    private var poolList = themeMenus[0].items
//    private var poolListDiff = themeMenusDiff[0].items
    
    private var groupBigSale = [HomeThemeGroup]()
    private var groupPartyRoom = [HomeThemeGroup]()
    private var groupSwimmingPool = [HomeThemeGroup]()
    private var groupSpa = [HomeThemeGroup]()
    private var themeBigSaleArray = [HomeThemeGroup]()
    private var themePartyRoomArray = [HomeThemeGroup]()
    private var themeSwimmingPoolArray = [HomeThemeGroup]()
    private var themeSpaArray = [HomeThemeGroup]()
    
    private var selectedIndexPath = 0
    
    var didSelectHandler: (() -> ())?
    
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
        
        fetchData()
        
        configureTitleView()
        configureMenuBar()
        configureCollectionView()
        configureTitleViewConstraints()
        configureCollectionViewConstraints()
        
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
    
    func fetchData() {
        
        let dispatchGroup = DispatchGroup()

        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchBigSale { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupBigSale = dataGroup ?? []
            self.themeBigSaleArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchPartyRoom { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupPartyRoom = dataGroup ?? []
            self.themePartyRoomArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchSwimmingPool { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupSwimmingPool = dataGroup ?? []
            self.themeSwimmingPoolArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchSpa { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupSpa = dataGroup ?? []
            self.themeSpaArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - Configuration
    
    // configuration titleView
    private func configureTitleView() {
        
        titleView.backgroundColor = .white
        
        titleLabel.text = "핫썸머 핫캉스"
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
    
    func reloadTitleLabel(themeTitle: String, themeTitleDiff: String) {
        if isState {
            titleLabel.text = themeTitleFirst
        } else {
            titleLabel.text = themeTitleSecond
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
        
        if isState {
            return themeBigSaleArray.count / 2
        } else {
            return themeSwimmingPoolArray.count / 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThemeCollectionViewCell.identifier, for: indexPath) as! HomeThemeCollectionViewCell
        
        if isState {
            
            let themeGroup = themeBigSaleArray[indexPath.item]
            cell.configureCellContent(image: themeGroup.mainImage, title: themeGroup.stay, price: themeGroup.saleDaysPrice)
            
            homeThemeCollectionViewCell = cell
        } else {

            let themeGroup = themeSwimmingPoolArray[indexPath.item]
            cell.configureCellContent(image: themeGroup.mainImage, title: themeGroup.stay, price: themeGroup.saleDaysPrice)
            
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

extension HomeThemeTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectHandler?()
        print(indexPath.item)
        
        if isState {
            let totalFirstThemeGroup = [groupBigSale, groupPartyRoom, groupSwimmingPool, groupSpa]
            let passStayId = totalFirstThemeGroup[selectedIndexPath][indexPath.item]
            print(totalFirstThemeGroup[selectedIndexPath][indexPath.item].stayId)
            singleTon.stayID = passStayId.stayId
            print(singleTon.stayID)
        } else {
            let totalSecondThemeGroup = [groupSwimmingPool, groupSpa, groupBigSale, groupPartyRoom]
            let passStayId = totalSecondThemeGroup[selectedIndexPath][indexPath.item]
            print(totalSecondThemeGroup[selectedIndexPath][indexPath.item].stayId)
            singleTon.stayID = passStayId.stayId
            print(singleTon.stayID)
        }
    }
}

// MARK: - HomeThemeCollectionViewMenuBar Delegate
extension HomeThemeTableViewCell: MenuBarDelegate {
    func menuBarDidSelected(_ indexPath: IndexPath) {
        homeViewCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        selectedIndexPath = indexPath.item
        
        let totalFirstThemeGroup = [groupBigSale, groupPartyRoom, groupSwimmingPool, groupSpa]
        let firstTheme = totalFirstThemeGroup[indexPath.item]
        themeBigSaleArray = firstTheme
        
        let totalSecondThemeGroup = [groupSwimmingPool, groupSpa, groupBigSale, groupPartyRoom]
        let secondTheme = totalSecondThemeGroup[indexPath.item]
        themeSwimmingPoolArray = secondTheme
        
        homeViewCollectionView.reloadData()
    }
}
