//
//  HomeThemeSecondTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 07/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeSecondTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "HomeThemeSecondTableViewCell"
    
    
    // TitleView
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let titleButton = UIButton(type: .custom)
    private let titleLine = UIView()
    private let menuBar = HomeThemeSecondCollectionViewMenuBar()
    
    private var homeThemeCollectionViewCell = HomeThemeCollectionViewCell()
    private var isState = true
    
    private var groupBigSale = [HomeThemeGroup]()
    private var groupPartyRoom = [HomeThemeGroup]()
    private var groupSwimmingPool = [HomeThemeGroup]()
    private var groupSpa = [HomeThemeGroup]()
    private var themeBigSaleArray = [HomeThemeGroup]()
    private var themePartyRoomArray = [HomeThemeGroup]()
    private var themeSwimmingPoolArray = [HomeThemeGroup]()
    private var themeSpaArray = [HomeThemeGroup]()
    
    private var selectedIndexPath = 0
    var secondCollectionViewDidSelectHandler: (() -> ())?
    
    // CollectionView
    private let homeViewSecondCollectionView : UICollectionView = {
        
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
                self.homeViewSecondCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchPartyRoom { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupPartyRoom = dataGroup ?? []
            self.themePartyRoomArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewSecondCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchSwimmingPool { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupSwimmingPool = dataGroup ?? []
            self.themeSwimmingPoolArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewSecondCollectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        HomeThemeDataSource.shared.fetchSpa { (dataGroup, error) in
            dispatchGroup.leave()
            self.groupSpa = dataGroup ?? []
            self.themeSpaArray = dataGroup ?? []
            
            DispatchQueue.main.async {
                self.homeViewSecondCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - Configuration
    
    // configuration titleView
    private func configureTitleView() {
        
        titleView.backgroundColor = .white
        
        titleLabel.text = "당장 떠나자! 여름휴가~"
        titleLabel.textAlignment = .left
        titleLabel.textColor = #colorLiteral(red: 0.1794605851, green: 0.184564501, blue: 0.1800470352, alpha: 1)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        titleButton.setImage(#imageLiteral(resourceName: "titleButton"), for: .normal)
        titleButton.contentMode = .scaleAspectFit
        
        titleLine.backgroundColor = #colorLiteral(red: 0.934979856, green: 0.9322634339, blue: 0.931660831, alpha: 1)
        
        contentView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(titleButton)
        titleView.addSubview(titleLine)
    }
    
    // configuration menuBar(CollectionView)
    private func configureMenuBar() {
        contentView.addSubview(menuBar)
        
        menuBar.menuSecondCollectionView.register(HomeThemeMenuCollectionCell.self, forCellWithReuseIdentifier: HomeThemeMenuCollectionCell.identifier)
        
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    // configuration collectionView
    private func configureCollectionView() {
        
        homeViewSecondCollectionView.dataSource = self
        homeViewSecondCollectionView.delegate = self
        homeViewSecondCollectionView.isScrollEnabled = false
        
        homeViewSecondCollectionView.register(HomeThemeCollectionViewCell.self, forCellWithReuseIdentifier: HomeThemeCollectionViewCell.identifier)
        
        contentView.addSubview(homeViewSecondCollectionView)
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
        
        titleLine.translatesAutoresizingMaskIntoConstraints = false
        titleLine.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        titleLine.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        titleLine.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        titleLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // constraints CollectionView
    private func configureCollectionViewConstraints() {
        homeViewSecondCollectionView.translatesAutoresizingMaskIntoConstraints = false
        homeViewSecondCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        homeViewSecondCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        homeViewSecondCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        homeViewSecondCollectionView.heightAnchor.constraint(equalToConstant: 430).isActive = true
        homeViewSecondCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    // MARK: - reload global methods
    
    func reloadCollectionView() {
        isState.toggle()
        homeViewSecondCollectionView.reloadData()
    }
    
    func reloadMenuBar() {
        menuBar.reloadSecondMenuCollectionView()
    }
    
    func reloadTitleLabel(themeTitle: String, themeTitleDiff: String) {
        if isState {
            titleLabel.text = themeTitleThird
        } else {
            titleLabel.text = themeTitleFourth
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
extension HomeThemeSecondTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isState {
            return themeSwimmingPoolArray.count / 2
        } else {
            return themeSpaArray.count / 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThemeCollectionViewCell.identifier, for: indexPath) as! HomeThemeCollectionViewCell
        
        if isState {
            
            let themeGroup = themeSwimmingPoolArray[indexPath.item]
            cell.configureCellContent(image: themeGroup.mainImage, title: themeGroup.stay, price: themeGroup.saleDaysPrice)
            
            homeThemeCollectionViewCell = cell
        } else {
            
            let themeGroup = themeSpaArray[indexPath.item]
            cell.configureCellContent(image: themeGroup.mainImage, title: themeGroup.stay, price: themeGroup.saleDaysPrice)
            
            homeThemeCollectionViewCell = cell
        }
        
        return cell
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension HomeThemeSecondTableViewCell: UICollectionViewDelegateFlowLayout {
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

extension HomeThemeSecondTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        secondCollectionViewDidSelectHandler?()
        
        if isState {
            let totalThirdThemeGroup = [groupSwimmingPool, groupBigSale, groupSpa, groupPartyRoom]
            let passStayId = totalThirdThemeGroup[selectedIndexPath][indexPath.item]
            print(totalThirdThemeGroup[selectedIndexPath][indexPath.item].stayId)
            singleTon.stayID = passStayId.stayId
            print(singleTon.stayID)
        } else {
            let totalFourthThemeGroup = [groupSpa, groupPartyRoom, groupSwimmingPool, groupBigSale]
            let passStayId = totalFourthThemeGroup[selectedIndexPath][indexPath.item]
            print(totalFourthThemeGroup[selectedIndexPath][indexPath.item].stayId)
            singleTon.stayID = passStayId.stayId
            print(singleTon.stayID)
        }
    }
}

// MARK: - HomeThemeCollectionViewMenuBar Delegate
extension HomeThemeSecondTableViewCell: SecondMenuBarDelegate {
    func secondMenuBarDidSelected(_ indexPath: IndexPath) {
        homeViewSecondCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        let totalThirdThemeGroup = [groupSwimmingPool, groupBigSale, groupSpa, groupPartyRoom]
        let thirdTheme = totalThirdThemeGroup[indexPath.item]
        themeSwimmingPoolArray = thirdTheme
        
        let totalFourthThemeGroup = [groupSpa, groupPartyRoom, groupSwimmingPool, groupBigSale]
        let fourthTheme = totalFourthThemeGroup[indexPath.item]
        themeSpaArray = fourthTheme
        
        homeViewSecondCollectionView.reloadData()
    }
}
