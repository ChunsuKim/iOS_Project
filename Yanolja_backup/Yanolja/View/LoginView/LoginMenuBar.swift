//
//  LoginMenuBar.swift
//  Yanolja
//
//  Created by Chunsu Kim on 23/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol LoginMenuBarDelegate {
    func loginMenuBarDidSelected(_ indexPath: IndexPath)
}


class LoginMenuBar: UIView {
    
    // MARK: - Properties
    var delegate: LoginMenuBarDelegate?
    
    let loginMenuCollectionView: UICollectionView = {
        
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
    
    private let lineViewBottom = UIView()
    
    // MARK: - Init Method
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
    
    // MARK: - Configuration
    
    private func configureCollectionView() {
        loginMenuCollectionView.delegate = self
        loginMenuCollectionView.dataSource = self
        
        loginMenuCollectionView.register(LoginMenuCollectionViewCell.self, forCellWithReuseIdentifier: LoginMenuCollectionViewCell.identifier)
    }
    
    private func configureLineViews() {
        indicatorBar.backgroundColor = .black
        lineViewBottom.backgroundColor = .lightGray
    }
    
    private func setSelectedMenuBar() {
        loginMenuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    // MARK: - Configuration Constraints
    
    var indicatorBarLeadingConstraint: NSLayoutConstraint!
    var indicatorBarWidthConst: NSLayoutConstraint!
    
    private func configureConstraints() {
        addSubview(loginMenuCollectionView)
        addSubview(lineViewBottom)
        addSubview(indicatorBar)
        
        loginMenuCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loginMenuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loginMenuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loginMenuCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        lineViewBottom.translatesAutoresizingMaskIntoConstraints = false
        lineViewBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineViewBottom.topAnchor.constraint(equalTo: loginMenuCollectionView.bottomAnchor, constant: 10).isActive = true
        lineViewBottom.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineViewBottom.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        indicatorBar.translatesAutoresizingMaskIntoConstraints = false
        indicatorBar.heightAnchor.constraint(equalToConstant: 1.25).isActive = true
        indicatorBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        indicatorBarWidthConst = indicatorBar.widthAnchor.constraint(equalTo: loginMenuCollectionView.widthAnchor, multiplier: 0.001)
        indicatorBarWidthConst.isActive = true
        
        
        
        indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: leadingAnchor)
        indicatorBarLeadingConstraint.isActive = true
    }
    
    // MARK: - Global Method
    func reloadMenuCollectionView() {
        isState.toggle()
        loginMenuCollectionView.reloadData()
        setSelectedMenuBar()
    }
    
    var savingWidthArray = [CGFloat]()
    
    func calculateIndicatorLeadingAndWidth(index: Int) {
        let cellWidth = self.frame.width / 2
        
        var cellToIndicatorLeading = (cellWidth - savingWidthArray[index]) / 2
        
        if index != 0 {
            cellToIndicatorLeading += cellWidth
        }
        
        indicatorBarLeadingConstraint.constant = cellToIndicatorLeading
        indicatorBarWidthConst.constant = savingWidthArray[index]
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

// MARK: - CollectionView DataSource
extension LoginMenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginMenuCollectionViewCell.identifier, for: indexPath) as! LoginMenuCollectionViewCell
        
            cell.loginMenuLabel.text = loginMenuTitle[indexPath.row]
        
        let textSize = cell.loginMenuLabel.text!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]).width
        
        savingWidthArray.insert(textSize, at: indexPath.row)
        
        if indexPath.row == 0 {
            let leadingConst: CGFloat = (UIScreen.main.bounds.width) * 0.5 * 0.5
            //            indicatorBar.frame.size.width = textSize
            indicatorBarWidthConst.isActive = true
            indicatorBarWidthConst.constant = textSize
            
            indicatorBarLeadingConstraint.constant = leadingConst - (textSize / 2)
            
            print("cellWidth: ", cell.frame.width)
        }
        
        return cell
    }
}

// MARK: - CollectionView Delegate
extension LoginMenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.loginMenuBarDidSelected(indexPath)
        
        calculateIndicatorLeadingAndWidth(index: indexPath.row)
        
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension LoginMenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / CGFloat(2), height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
