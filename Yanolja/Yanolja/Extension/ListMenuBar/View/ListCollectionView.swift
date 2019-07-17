//
//  ListCollectionView.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/17.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ListCollectionView: UIView {
    
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
        
        self.backgroundColor = .red
        
        configureCustomTabBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureCustomTabBar(){
        
        customMenuBar.delegate = self
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(customMenuBar)
        addSubview(pageCollectionView)
        
        customMenuBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customMenuBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // delegation
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        
        // register
        pageCollectionView.register(ListTableViewCell.self, forCellWithReuseIdentifier: ListTableViewCell.reusableIdentifier)
        
        // layout
        pageCollectionView.topAnchor.constraint(equalTo: customMenuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}


extension ListCollectionView: CustomMenuBarDelegate{
    func menuBarDidSelected(_ indexPath: IndexPath) {
        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension ListCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListTableViewCell.reusableIdentifier, for: indexPath) as! ListTableViewCell
//        cell.label.text = menuTitles[indexPath.row]
        return cell
    }
    
    
}

extension ListCollectionView: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customMenuBar.indicatorBarLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(menuTitles.count)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        let itemAt = Int(targetContentOffset.pointee.x / self.frame.width)
        print(itemAt)
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
