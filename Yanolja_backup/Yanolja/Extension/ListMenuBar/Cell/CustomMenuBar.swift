//
//  CustomMenuBar.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/17.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomMenuBar: UIView {
    
    var sum: CGFloat = 0
    var space: CGFloat = 10
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Properties
    
    let menuCollectionView: UICollectionView = {
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        // not show scroll indicator
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    let divideLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    let indicatorBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    var menuTitles = [String]()
    var menuTitlesSize = [CGFloat]()
    var indicatorBarLeadingConstraint: NSLayoutConstraint!
    var indicatorBarWidthConstraint: NSLayoutConstraint!
    
    var delegate: CustomMenuBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        widthArray()
        configureCollectionView()
        autolayout()
        
    }
    
    var widths = [CGFloat]()
    func widthArray() {
        for i in listMenuTitles {
            let tempWidth = i.size(withAttributes: [NSAttributedString.Key.strokeWidth : UIFont.systemFont(ofSize: 16)]).width
            let sumWidth = tempWidth + CGFloat(20)
            widths.append(sumWidth)
        }
    }
    
    func sumWidth(indexPath index: Int) -> CGFloat {
        if index == 0 {
            sum = 0
        } else {
            for i in 0...(index - 1) {
                sum += widths[i]
            }
            sum += (CGFloat(index) * space + 20)
            print(sum)
        }
        
        return sum
    }
    
    private func configureCollectionView(){
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        menuCollectionView.register(CustomMenuCell.self, forCellWithReuseIdentifier: CustomMenuCell.reusableIdentifier)
    }
    
    private func autolayout(){
        
        addSubview(menuCollectionView)
        addSubview(divideLine)
        
        menuCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        divideLine.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor).isActive = true
        divideLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        divideLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        divideLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divideLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension CustomMenuBar: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomMenuCell.reusableIdentifier, for: indexPath) as! CustomMenuCell
        cell.label.text = menuTitles[indexPath.row]
        return cell
    }
    
}

extension CustomMenuBar: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.menuBarDidSelected(indexPath)
        
        menuCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        print(menuCollectionView)
    }
    
}

extension CustomMenuBar: UICollectionViewDelegateFlowLayout{
    // FIXME: - width값만 적용됨
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: widths[indexPath.item], height: 40)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
