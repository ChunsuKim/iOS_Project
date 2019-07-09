//
//  HomeEventTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 09/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeEventTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeEventTableViewCell"
    var poolList = DataManager.shared.pools
    
    // TitleView
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let titleButton = UIButton(type: .custom)
    
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
        
        configureTitleView()
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
    
    // configuration collectionView
    private func configureCollectionView() {
        
        homeViewCollectionView.dataSource = self
        homeViewCollectionView.delegate = self
        homeViewCollectionView.isScrollEnabled = false
        
        homeViewCollectionView.register(HomeEventCollectionViewCell.self, forCellWithReuseIdentifier: HomeEventCollectionViewCell.identifier)
        
        contentView.addSubview(homeViewCollectionView)
    }
    
    // MARK: - Configuration Constraints
    
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
    
    private func configureCollectionViewConstraints() {
        homeViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        homeViewCollectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        homeViewCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        homeViewCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        homeViewCollectionView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        homeViewCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

// MARK: - CollectionView Data Source Extension
extension HomeEventTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.pools.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventCollectionViewCell.identifier, for: indexPath) as! HomeEventCollectionViewCell
        
        cell.configureCellContent(image: UIImage(named: poolList[indexPath.row].imageName), title: poolList[indexPath.row].title, price: poolList[indexPath.row].price)
//        cell.configureCellContent(image: UIImage(named: "IU"), title: "아이유")
        
        return cell
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension HomeEventTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: 190)
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
