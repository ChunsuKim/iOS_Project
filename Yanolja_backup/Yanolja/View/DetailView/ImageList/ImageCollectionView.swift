//
//  ImageCollectionView.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/29.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ImageCollectionView: UITableViewCell {
    
    var saveImageList: [String] = []{
        didSet{
            totalCount = self.saveImageList.count
            reloadImageList()
        }
    }
    
    var totalCount = 0
    var currentCount = 0
    
    let collectionView: UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    let textWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let imageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대표사진"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let currentIndexByTotalCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let totalImage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전체사진"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return label
    }()
    
    // MARK: - Init Method
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureCollectionView()
        configureAutoLayout()
    }
    
    func reloadImageList() {
        collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        totalCount = saveImageList.count
        
        currentIndexByTotalCount.text = "\(currentCount + 1)/\(totalCount)"
        
        contentView.addSubview(collectionView)
        contentView.addSubview(textWrap)
        textWrap.addSubview(imageTitleLabel)
        textWrap.addSubview(currentIndexByTotalCount)
        textWrap.addSubview(totalImage)
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            
            textWrap.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            textWrap.heightAnchor.constraint(equalToConstant: 30),
            textWrap.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textWrap.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -10),
            
            imageTitleLabel.topAnchor.constraint(equalTo: textWrap.topAnchor),
            imageTitleLabel.leadingAnchor.constraint(equalTo: textWrap.leadingAnchor),
            imageTitleLabel.widthAnchor.constraint(equalTo: textWrap.widthAnchor, multiplier: 0.3),
            imageTitleLabel.centerYAnchor.constraint(equalTo: textWrap.centerYAnchor),
            imageTitleLabel.heightAnchor.constraint(equalTo: textWrap.heightAnchor),
            
            currentIndexByTotalCount.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            currentIndexByTotalCount.centerYAnchor.constraint(equalTo: textWrap.centerYAnchor),
            currentIndexByTotalCount.widthAnchor.constraint(equalTo: textWrap.widthAnchor, multiplier: 0.3),
            currentIndexByTotalCount.heightAnchor.constraint(equalToConstant: 30),
            
            totalImage.widthAnchor.constraint(equalToConstant: 70),
            totalImage.heightAnchor.constraint(equalTo: textWrap.heightAnchor),
            totalImage.centerYAnchor.constraint(equalTo: currentIndexByTotalCount.centerYAnchor),
            totalImage.trailingAnchor.constraint(equalTo: textWrap.trailingAnchor),
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ImageCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saveImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier, for: indexPath) as! DetailImageCollectionViewCell
        cell.imageView.downloadImageFrom(saveImageList[indexPath.row], contentMode: .scaleAspectFill)
        
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
        
        totalCount = saveImageList.count
        
        currentIndexByTotalCount.text = "\(currentCount + 1)/\(totalCount)"
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension ImageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
