//
//  HomePopTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 17/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomePopTableViewCell: UITableViewCell, UICollectionViewDataSource {
    
    // MARK: - Properties
    static let identifier = "HomePopTableViewCell"
    
    private var popList = PopDataManager.shared.pops
    private var scrollStartNumber = 1
    private let pagecontrols = UIPageControl()
    
    private let popViewCollectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configureCollectionView()
        configureCollectionViewConstraints()
        configurePagecontrols()
        setTimer()
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
    private func configureCollectionView() {
        popViewCollectionView.dataSource = self
        popViewCollectionView.delegate = self
        popViewCollectionView.clipsToBounds = true
        popViewCollectionView.layer.cornerRadius = 10
        popViewCollectionView.isPagingEnabled = true
        
        popViewCollectionView.register(HomePopCollectionViewCell.self, forCellWithReuseIdentifier: HomePopCollectionViewCell.identifier)
        
        contentView.addSubview(popViewCollectionView)
    }
    
    private func configureCollectionViewConstraints() {
        popViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        popViewCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        popViewCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        popViewCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        popViewCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        popViewCollectionView.heightAnchor.constraint(equalToConstant: 260).isActive = true
    }
    
    private func configurePagecontrols() {
        pagecontrols.numberOfPages = 4
        popViewCollectionView.addSubview(pagecontrols)
        
        pagecontrols.translatesAutoresizingMaskIntoConstraints = false
        pagecontrols.bottomAnchor.constraint(equalTo: popViewCollectionView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        pagecontrols.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pagecontrols.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        pagecontrols.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    // MARK: - Action Method
    @objc private func startTimer() {
        pagecontrols.currentPage = scrollStartNumber
        if scrollStartNumber < 4 {
            let indexPath = IndexPath(item: scrollStartNumber, section: 0)
            popViewCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            scrollStartNumber = scrollStartNumber + 1
        } else {
            scrollStartNumber = 0
            popViewCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        }
        
    }

    // MARK: - UICollection View DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePopCollectionViewCell.identifier, for: indexPath) as! HomePopCollectionViewCell
        cell.configureCellContent(image: UIImage(named: popList[indexPath.row].imageName))
        
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension HomePopTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: contentView.frame.width - 40, height: contentView.frame.height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
