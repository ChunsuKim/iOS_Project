//
//  ListCollectionView.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/17.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ListCollectionView: UIView {
    
    var sum: CGFloat = 0
    var space: CGFloat = 10
    
    let pageCollectionView: UICollectionView = {
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        // not show scroll indicator
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.isPagingEnabled = true
        collectionView.allowsSelection = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let customMenuBar = CustomMenuBar()
    
    var menuTitles = [String]() {
        didSet {
            customMenuBar.menuTitles = menuTitles
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCustomTabBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureCustomTabBar(){
        
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(customMenuBar)
        addSubview(pageCollectionView)
        
        customMenuBar.delegate = self
        
        customMenuBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customMenuBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // delegation
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        
        // register
        //Custom CollectionView Cell
        pageCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reusableIdentifier)
        // default CollectionView Cell
        pageCollectionView.register(DefaultCollectionViewCell.self, forCellWithReuseIdentifier: DefaultCollectionViewCell.reusableIdentifier)
        
        // layout
        pageCollectionView.topAnchor.constraint(equalTo: customMenuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}

extension ListCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
            case 2...4:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.reusableIdentifier, for: indexPath) as! DefaultCollectionViewCell
                //        cell.label.text = menuTitles[indexPath.row]
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                //        cell.label.text = menuTitles[indexPath.row]
                return cell
        }
    }
    
    
}

extension ListCollectionView: UICollectionViewDelegate{

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.frame.width)
        print("##### : ", itemAt)
        customMenuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
}

extension ListCollectionView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height - customMenuBar.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// 메뉴 클릭시 뷰 스크롤 이동
extension ListCollectionView: CustomMenuBarDelegate{
    func menuBarDidSelected(_ indexPath: IndexPath) {
        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}
