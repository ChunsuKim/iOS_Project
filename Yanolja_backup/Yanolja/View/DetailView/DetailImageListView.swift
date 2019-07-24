////
////  DetailImageListView.swift
////  Yanolja
////
////  Created by JinBae Jeong on 2019/07/23.
////  Copyright © 2019 Chunsu Kim. All rights reserved.
////
//
//import UIKit
//
//class DetailImageListView: UIView {
//    
//    let pageCollectionView: UICollectionView = {
//        // flow layout
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        
//        // collection view
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        
//        // not show scroll indicator
//        collectionView.showsHorizontalScrollIndicator = false
//        
//        collectionView.isPagingEnabled = true
//        collectionView.allowsSelection = true
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .white
//        return collectionView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureCustomTabBar()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    private func configureCustomTabBar(){
//        
//        addSubview(pageCollectionView)
//        
//        // delegation
//        pageCollectionView.dataSource = self
//        pageCollectionView.delegate = self
//        
//        // register
//        pageCollectionView.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier)
//        
//        // layout
//        pageCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        pageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        pageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        pageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        
//    }
//    
//}
//
//extension DetailImageListView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return menuTitles.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier, for: indexPath) as! DetailImageCollectionViewCell
//        return cell
//    }
//    
//    
//}
//
//extension DetailImageListView: UICollectionViewDelegate{
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        print(targetContentOffset.pointee.x)
//        let itemAt = Int(targetContentOffset.pointee.x / self.frame.width)
//        print(itemAt)
//        menuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
//    }
//}
//
//extension DetailImageListView: UICollectionViewDelegateFlowLayout{
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width, height: self.frame.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
