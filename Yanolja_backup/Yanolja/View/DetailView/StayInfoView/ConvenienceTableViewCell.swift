//
//  ConvenienceTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/31.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ConvenienceTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    var facilitiesCount = 6
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "편의시설 및 서비스"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let facilitiesList: UICollectionView = {
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        // not show scroll indicator
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.isPagingEnabled = true
        collectionView.allowsSelection = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FacilitiesCollectionViewCell.self, forCellWithReuseIdentifier: FacilitiesCollectionViewCell.reusableIdentifier)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(title)
        contentView.addSubview(facilitiesList)
        
        facilitiesList.dataSource = self
        facilitiesList.delegate = self
        
        configureConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure constraints
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.bottomAnchor.constraint(equalTo: facilitiesList.topAnchor, constant: -20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            facilitiesList.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            facilitiesList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            facilitiesList.trailingAnchor.constraint(equalTo: title.trailingAnchor),
        ])
    }
    
}

extension ConvenienceTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facilitiesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FacilitiesCollectionViewCell.reusableIdentifier, for: indexPath) as! FacilitiesCollectionViewCell
        
        cell.icon.image = UIImage(named: "star")
        cell.cont.text = "test"
        
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension ConvenienceTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (contentView.frame.width - 40) / 5, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 26
    }
}

