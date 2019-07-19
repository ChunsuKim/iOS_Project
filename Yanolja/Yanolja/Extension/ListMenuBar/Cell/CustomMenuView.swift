//
//  MenuView.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/17.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomMenuView: UIView {
    
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
        
//        customMenuBar.delegate = self
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
        pageCollectionView.register(CustomMenuCell.self, forCellWithReuseIdentifier: CustomMenuCell.reusableIdentifier)
        
        // layout
        pageCollectionView.topAnchor.constraint(equalTo: customMenuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}


//extension CustomMenuView: CustomMenuBarDelegate{
//    func menuBarDidSelected(_ indexPath: IndexPath) {
//        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
//    }
//}

extension CustomMenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomMenuCell.reusableIdentifier, for: indexPath) as! CustomMenuCell
        cell.label.text = menuTitles[indexPath.row]
        return cell
    }
    
    
}

extension CustomMenuView: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(1111)
        customMenuBar.indicatorBarLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(menuTitles.count)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        let itemAt = Int(targetContentOffset.pointee.x / self.frame.width)
//        print(itemAt)
        customMenuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        customMenuBar.indicatorBarLeadingConstraint.constant = targetContentOffset.pointee.x
    }
}

extension CustomMenuView: UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 550, left: 0, bottom: 0, right: 0)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}
