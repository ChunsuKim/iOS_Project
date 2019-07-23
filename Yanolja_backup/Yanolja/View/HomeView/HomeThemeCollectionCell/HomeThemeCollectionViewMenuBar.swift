//
//  HomeThemeCollectionViewMenuBar.swift
//  Yanolja
//
//  Created by Chunsu Kim on 15/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol MenuBarDelegate {
    func menuBarDidSelected(_ indexPath: IndexPath)
}

class HomeThemeCollectionViewMenuBar: UIView {
    
    var homeThemeMenuCollectionView = HomeThemeMenuCollectionCell()
    var delegate: MenuBarDelegate?

    let menuCollectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    private var isState = true
    private let indicatorBar = UIView()
    private let lineViewTop = UIView()
    private let lineViewBottom = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCollectionView()
        configureLineViews()
        setSelectedMenuBar()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        
        menuCollectionView.register(HomeThemeMenuCollectionCell.self, forCellWithReuseIdentifier: HomeThemeMenuCollectionCell.identifier)
    }
    
    private func configureLineViews() {
        indicatorBar.backgroundColor = .black
        lineViewTop.backgroundColor = #colorLiteral(red: 0.934979856, green: 0.9322634339, blue: 0.931660831, alpha: 1)
        lineViewBottom.backgroundColor = #colorLiteral(red: 0.934979856, green: 0.9322634339, blue: 0.931660831, alpha: 1)
    }
    
    private func setSelectedMenuBar() {
        menuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func reloadMenuCollectionView() {
        isState.toggle()
        menuCollectionView.reloadData()
        setSelectedMenuBar()
    }
    
    var indicatorBarLeadingConstraint: NSLayoutConstraint!
    var indicatorBarWidthConst: NSLayoutConstraint!
    
    private func configureConstraints() {
        addSubview(menuCollectionView)
        addSubview(lineViewTop)
        addSubview(lineViewBottom)
        addSubview(indicatorBar)
        
        menuCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        lineViewTop.translatesAutoresizingMaskIntoConstraints = false
        lineViewTop.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineViewTop.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lineViewTop.leadingAnchor.constraint(equalTo: menuCollectionView.leadingAnchor).isActive = true
        lineViewTop.trailingAnchor.constraint(equalTo: menuCollectionView.trailingAnchor).isActive = true
        
        lineViewBottom.translatesAutoresizingMaskIntoConstraints = false
        lineViewBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineViewBottom.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineViewBottom.leadingAnchor.constraint(equalTo: lineViewTop.leadingAnchor).isActive = true
        lineViewBottom.trailingAnchor.constraint(equalTo: lineViewTop.trailingAnchor).isActive = true
        
        indicatorBar.translatesAutoresizingMaskIntoConstraints = false
        indicatorBar.heightAnchor.constraint(equalToConstant: 1.25).isActive = true
        indicatorBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        indicatorBar.widthAnchor.constraint(equalTo: menuCollectionView.widthAnchor, multiplier: 0.25).isActive = true
        
        indicatorBarWidthConst = indicatorBar.widthAnchor.constraint(equalTo: menuCollectionView.widthAnchor, multiplier: 0.001)
        indicatorBarWidthConst.isActive = true

        
        
        indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: leadingAnchor)
//        indicatorBarLeadingConstraint = indicatorBar.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConst)
        indicatorBarLeadingConstraint.isActive = true
    }
    
}

extension HomeThemeCollectionViewMenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThemeMenuCollectionCell.identifier, for: indexPath) as! HomeThemeMenuCollectionCell
        
        if isState {
            cell.menuLabel.text = themeMenus[indexPath.row].menu
            homeThemeMenuCollectionView = cell
        } else {
            cell.menuLabel.text = themeMenusDiff[indexPath.row].menu
            homeThemeMenuCollectionView = cell
        }
        
        let textSize = cell.menuLabel.text!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]).width
        
        if indexPath.row == 0 {
            let leadingConst: CGFloat = (UIScreen.main.bounds.width - 40) * 0.25 * 0.5
//            indicatorBar.frame.size.width = textSize
            indicatorBarWidthConst.isActive = true
            indicatorBarWidthConst.constant = textSize
            
            indicatorBarLeadingConstraint.constant = leadingConst - (textSize / 2)
            
            print("cellWidth: ", cell.frame.width)
        }
        
        return cell
    }
}

extension HomeThemeCollectionViewMenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelect")
        delegate?.menuBarDidSelected(indexPath)
        
        let cell = collectionView.cellForItem(at: indexPath) as! HomeThemeMenuCollectionCell
        
        let textSize = cell.menuLabel.text!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]).width
        
//        indicatorBar.frame.size.width = textSize
        
        let cellWidth = (self.frame.width / CGFloat(4))
        let size = (self.frame.width / CGFloat(4)) * CGFloat(indexPath.row)
        
        indicatorBarLeadingConstraint.constant = size + ((cellWidth - textSize) / 2)
        indicatorBarWidthConst.constant = textSize
        
        
        print("textSize: ", textSize)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

extension HomeThemeCollectionViewMenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / CGFloat(4), height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
