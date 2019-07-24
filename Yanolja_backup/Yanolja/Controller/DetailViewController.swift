//
//  DetailViewController.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/19.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    let customTab = CustomTabBarController()
    private var popList = PopDataManager.shared.pops
    
    var totalCount = 0
    var currentCount = 0
    
    let topNaviCustom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = #imageLiteral(resourceName: "back").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        button.addTarget(self, action: #selector(backEvent(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let stayNaviTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "선릉 호텔 발리"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = #imageLiteral(resourceName: "heart").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = #imageLiteral(resourceName: "share").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let wrapView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: DetailImageCollectionViewCell.reusableIdentifier)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        
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
    
    let stayInfo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let stayTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "선릉 호텔 발리"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        return label
    }()
    
    let stayGradeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "star")
        
        return imageView
    }()
    
    let stayGradeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.5"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let reviewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "후기"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        return label
    }()
    
    let reviewCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(707)"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let bossReviewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "사장님 댓글"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        return label
    }()
    
    let bossReviewCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(707)"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let stayEventInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최저가보상제"
        label.textColor = #colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var image = #imageLiteral(resourceName: "regiond").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        imageView.image = image
        
        return imageView
    }()
    
    let locationCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2호선 역삼역 인근"
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let callIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var image = #imageLiteral(resourceName: "call").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        imageView.image = image
        
        return imageView
    }()
    
    let callCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전화하기"
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let selectRoomButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        
        return view
    }()
    
    let selectRoomButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("객실 선택하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.1803921569, blue: 0.3725490196, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(wrapView)
        
        view.addSubview(topNaviCustom)
        topNaviCustom.addSubview(backButton)
        topNaviCustom.addSubview(stayNaviTitle)
        topNaviCustom.addSubview(favoriteButton)
        topNaviCustom.addSubview(shareButton)
        
        view.addSubview(selectRoomButtonView)
        selectRoomButtonView.addSubview(selectRoomButton)
        
        configureImageCollectionView()
        configureStayInfoView()
        configureAutoLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        customTab.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        customTab.tabBar.isHidden = false
    }
    
    private func configureImageCollectionView() {
        wrapView.addSubview(imageCollectionView)
        view.addSubview(textWrap)
        textWrap.addSubview(imageTitleLabel)
        textWrap.addSubview(currentIndexByTotalCount)
        textWrap.addSubview(totalImage)
        
        wrapView.addSubview(stayInfo)
        
        totalCount = popList.count
        
        currentIndexByTotalCount.text = "\(currentCount + 1)/\(totalCount)"
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }
    
    private func configureStayInfoView() {
        stayInfo.addSubview(stayTitle)
        stayInfo.addSubview(stayGradeIcon)
        stayInfo.addSubview(stayGradeLabel)
        stayInfo.addSubview(reviewTitle)
        stayInfo.addSubview(reviewCont)
        stayInfo.addSubview(bossReviewTitle)
        stayInfo.addSubview(bossReviewCont)
        stayInfo.addSubview(stayEventInfo)
        stayInfo.addSubview(locationIcon)
        stayInfo.addSubview(locationCont)
        stayInfo.addSubview(callIcon)
        stayInfo.addSubview(callCont)
    }
    
    private func configureAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            wrapView.topAnchor.constraint(equalTo: view.topAnchor),
            wrapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wrapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wrapView.bottomAnchor.constraint(equalTo: selectRoomButtonView.topAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            imageCollectionView.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            imageCollectionView.widthAnchor.constraint(equalTo: wrapView.widthAnchor),
            imageCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            textWrap.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            textWrap.heightAnchor.constraint(equalToConstant: 30),
            textWrap.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textWrap.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -10),
            
            imageTitleLabel.topAnchor.constraint(equalTo: textWrap.topAnchor),
            imageTitleLabel.leadingAnchor.constraint(equalTo: textWrap.leadingAnchor),
            imageTitleLabel.widthAnchor.constraint(equalTo: textWrap.widthAnchor, multiplier: 0.3),
            imageTitleLabel.centerYAnchor.constraint(equalTo: textWrap.centerYAnchor),
            imageTitleLabel.heightAnchor.constraint(equalTo: textWrap.heightAnchor),
            
            currentIndexByTotalCount.centerXAnchor.constraint(equalTo: imageCollectionView.centerXAnchor),
            currentIndexByTotalCount.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -10),
            currentIndexByTotalCount.widthAnchor.constraint(equalTo: imageCollectionView.widthAnchor, multiplier: 0.3),
            currentIndexByTotalCount.heightAnchor.constraint(equalToConstant: 30),
            
            totalImage.widthAnchor.constraint(equalToConstant: 70),
            totalImage.heightAnchor.constraint(equalTo: textWrap.heightAnchor),
            totalImage.centerYAnchor.constraint(equalTo: currentIndexByTotalCount.centerYAnchor),
            totalImage.trailingAnchor.constraint(equalTo: textWrap.trailingAnchor),
            
            topNaviCustom.topAnchor.constraint(equalTo: view.topAnchor),
            topNaviCustom.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topNaviCustom.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            topNaviCustom.heightAnchor.constraint(equalToConstant: 140),
            backButton.leadingAnchor.constraint(equalTo: topNaviCustom.leadingAnchor, constant: 20),
            backButton.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            stayNaviTitle.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor),
            stayNaviTitle.centerXAnchor.constraint(equalTo: topNaviCustom.centerXAnchor),
            stayNaviTitle.heightAnchor.constraint(equalToConstant: 20),
            stayNaviTitle.widthAnchor.constraint(equalTo: topNaviCustom.widthAnchor, multiplier: 0.3),
            favoriteButton.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            shareButton.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: topNaviCustom.trailingAnchor, constant: -20),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20),
            
            stayInfo.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 20),
            stayInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stayInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stayInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stayTitle.topAnchor.constraint(equalTo: stayInfo.topAnchor),
            stayTitle.leadingAnchor.constraint(equalTo: stayInfo.leadingAnchor),
            stayTitle.widthAnchor.constraint(equalTo: stayInfo.widthAnchor),
            stayTitle.bottomAnchor.constraint(equalTo: stayGradeIcon.topAnchor, constant: -20),
            stayGradeIcon.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            stayGradeIcon.widthAnchor.constraint(equalToConstant: 23),
            stayGradeIcon.heightAnchor.constraint(equalToConstant: 23),
            stayGradeIcon.bottomAnchor.constraint(equalTo: stayEventInfo.topAnchor, constant: -10),
            stayGradeLabel.leadingAnchor.constraint(equalTo: stayGradeIcon.trailingAnchor, constant: 5),
            stayGradeLabel.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            reviewTitle.leadingAnchor.constraint(equalTo: stayGradeLabel.trailingAnchor, constant: 20),
            reviewTitle.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            reviewCont.leadingAnchor.constraint(equalTo: reviewTitle.trailingAnchor, constant: 5),
            reviewCont.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            bossReviewTitle.leadingAnchor.constraint(equalTo: reviewCont.trailingAnchor, constant: 20),
            bossReviewTitle.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            bossReviewCont.leadingAnchor.constraint(equalTo: bossReviewTitle.trailingAnchor, constant: 5),
            bossReviewCont.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            stayEventInfo.leadingAnchor.constraint(equalTo: stayInfo.leadingAnchor),
            stayEventInfo.bottomAnchor.constraint(equalTo: locationIcon.topAnchor, constant: -20),
            locationIcon.leadingAnchor.constraint(equalTo: stayInfo.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            locationCont.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            locationCont.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            callIcon.leadingAnchor.constraint(equalTo: locationCont.trailingAnchor, constant: 20),
            callIcon.centerYAnchor.constraint(equalTo: locationCont.centerYAnchor),
            callIcon.widthAnchor.constraint(equalToConstant: 20),
            callIcon.heightAnchor.constraint(equalToConstant: 20),
            callCont.leadingAnchor.constraint(equalTo: callIcon.trailingAnchor, constant: 5),
            callCont.centerYAnchor.constraint(equalTo: callIcon.centerYAnchor),
            
            selectRoomButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectRoomButtonView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            selectRoomButtonView.widthAnchor.constraint(equalTo: view.widthAnchor),
            selectRoomButtonView.heightAnchor.constraint(equalToConstant: 70),
            selectRoomButton.topAnchor.constraint(equalTo: selectRoomButtonView.topAnchor, constant: 5),
            selectRoomButton.leadingAnchor.constraint(equalTo: selectRoomButtonView.leadingAnchor, constant: 10),
            selectRoomButton.bottomAnchor.constraint(equalTo: selectRoomButtonView.bottomAnchor, constant: -5),
            selectRoomButton.trailingAnchor.constraint(equalTo: selectRoomButtonView.trailingAnchor, constant: -10),
        ])
    }
    
    // MARK: - actionc
    @objc private func backEvent(_ sender: UIButton) {
        print(1111)
        navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

extension DetailViewController: UICollectionViewDataSource {
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
        visibleRect.origin = imageCollectionView.contentOffset
        visibleRect.size = imageCollectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = imageCollectionView.indexPathForItem(at: visiblePoint) else { return }
        
        currentCount = indexPath.row
        
        totalCount = popList.count
        
        currentIndexByTotalCount.text = "\(currentCount + 1)/\(totalCount)"
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: imageCollectionView.frame.width, height: imageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
