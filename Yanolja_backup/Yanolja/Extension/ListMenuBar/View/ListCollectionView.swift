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
    
    var listTotalStayData = [StayListElement]()
    var listMotelData = [StayListElement]()
    var listHotelData = [StayListElement]()
    var listPensionData = [StayListElement]()
    var listGuestHouseData = [StayListElement]() {
        didSet {
            reloadData()
        }
    }
    
    
    
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
    
    func reloadData() {
        DispatchQueue.main.async {
            self.pageCollectionView.reloadData()
        }
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
        // empty CollectionView Cell
        pageCollectionView.register(EmptyCollectionViewCell.self, forCellWithReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier)
        
        // layout
        pageCollectionView.topAnchor.constraint(equalTo: customMenuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}

extension ListCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return menuTitles.count
            return listMenuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 여기서 카테고리 나눠야할듯?
        if let stayType = StayType.init(rawValue: indexPath.item) {
            switch stayType {
            case .모든숙소:
                if !listTotalStayData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listTotalStayData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .모텔:
                if !listMotelData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listMotelData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .호텔리조트:
                if !listHotelData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listHotelData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .펜션풀빌라:
                if !listPensionData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listPensionData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .게스트하우스:
                if !listGuestHouseData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listGuestHouseData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .무한쿠폰룸:
                if !listMotelData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listMotelData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .프렌차이즈:
                if !listMotelData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listMotelData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .신축리모델링:
                if !listTotalStayData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listTotalStayData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .초특가호텔:
                if !listHotelData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listHotelData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .인기숙소:
                if !listTotalStayData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listTotalStayData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .파티룸:
                if !listMotelData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listMotelData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .무료영화:
                if !listTotalStayData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listTotalStayData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            case .스파펜션:
                if !listPensionData.isEmpty {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as! CustomCollectionViewCell
                    cell.configureObject(data: listPensionData)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.reusableIdentifier, for: indexPath) as! EmptyCollectionViewCell
                    return cell
                }
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.reusableIdentifier, for: indexPath) as! DefaultCollectionViewCell
                
                if !listTotalStayData.isEmpty {
                    cell.configureObject(data: listTotalStayData)
                }
                
                return cell
            }
        } else {
            return UICollectionViewCell()
        }
        
    }
}
    enum StayType: Int {
        case 모든숙소 = 0
        case 모텔
        case 호텔리조트
        case 펜션풀빌라
        case 게스트하우스
        case 무한쿠폰룸
        case 프렌차이즈
        case 신축리모델링
        case 초특가호텔
        case 인기숙소
        case 파티룸
        case 무료영화
        case 스파펜션
    }
    
    extension ListCollectionView: UICollectionViewDelegate{
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let itemAt = Int(targetContentOffset.pointee.x / self.frame.width)
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
