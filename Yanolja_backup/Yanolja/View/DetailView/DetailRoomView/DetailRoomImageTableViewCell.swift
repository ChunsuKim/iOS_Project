//
//  DetailRoomImageTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DetailRoomImageTableViewCell: UITableViewCell {

    // MARK: - Properties
    private var popList = PopDataManager.shared.pops
    
    var totalCount = 0
    var currentCount = 1
    
    let collectionView: UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let countView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        totalCount = popList.count
        
        contentView.addSubview(collectionView)
        contentView.addSubview(countView)
        countView.addSubview(countLabel)
        
        configureCollectionView()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        countLabel.text = "\(currentCount)/\(totalCount)"
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            
            countView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            countView.heightAnchor.constraint(equalToConstant: 15),
            countView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            countLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
        ])
    }

}

extension DetailRoomImageTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier, for: indexPath) as! DetailImageCollectionViewCell
        cell.configureCellContent(image: UIImage(named: popList[indexPath.row].imageName))
        
        return cell
    }
    
    // collectionview current index
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        currentCount = indexPath.row
//
        totalCount = popList.count
//
        countLabel.text = "\(currentCount + 1)/\(totalCount)"
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension DetailRoomImageTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
