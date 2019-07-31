//
//  DetailViewController.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/19.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    let customTab = CustomTabBarController()
    
    let hotelRoomCount = 2
    let introContCount = 5
    let convenienceContCount = 5
    
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
    
    let detailView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let selectRoomButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        view.backgroundColor = .white
        
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

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(detailView)
        
        view.addSubview(topNaviCustom)
        topNaviCustom.addSubview(backButton)
        topNaviCustom.addSubview(stayNaviTitle)
        topNaviCustom.addSubview(favoriteButton)
        topNaviCustom.addSubview(shareButton)
        
        view.addSubview(selectRoomButtonView)
        selectRoomButtonView.addSubview(selectRoomButton)
        
        configureDetailView()
        configureConstraints()
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
    
    // MARK: - Configure DetailView
    private func configureDetailView() {
        detailView.dataSource = self
        detailView.delegate = self
        
        // collectionView safeArea 무시
        detailView.contentInsetAdjustmentBehavior = .never
        
        // imageCollectionView cell
        detailView.register(ImageCollectionView.self, forCellReuseIdentifier: ImageCollectionView.reusableIdentifier)
        
        // info stayRoom cell
        detailView.register(StayRoomListTableViewCell.self, forCellReuseIdentifier: StayRoomListTableViewCell.reusableIdentifier)
        
        // RoomList cell
        detailView.register(RoomListTableViewCell.self, forCellReuseIdentifier: RoomListTableViewCell.reusableIdentifier)
        
        // 요금정보, 질문&답변 cell
        detailView.register(StayRoomInfoTableViewCell.self, forCellReuseIdentifier: StayRoomInfoTableViewCell.reusableIdentifier)
        
        // 이벤트 cell
        detailView.register(StayRoomEventTableViewCell.self, forCellReuseIdentifier: StayRoomEventTableViewCell.reusableIdentifier)
        
        // 숙소 소개 cell
        detailView.register(IntroduceStayTableViewCell.self, forCellReuseIdentifier: IntroduceStayTableViewCell.reusableIdentifier)
        
        // 편의 시설 cell
        detailView.register(ConvenienceTableViewCell.self, forCellReuseIdentifier: ConvenienceTableViewCell.reusableIdentifier)
    }
    
    // MARK: - Configure Constraints
    private func configureConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
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
            
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: selectRoomButtonView.topAnchor),
            
            selectRoomButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectRoomButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            selectRoomButtonView.widthAnchor.constraint(equalTo: view.widthAnchor),
            selectRoomButtonView.heightAnchor.constraint(equalToConstant: 100),
            
            selectRoomButton.topAnchor.constraint(equalTo: selectRoomButtonView.topAnchor, constant: 5),
            selectRoomButton.leadingAnchor.constraint(equalTo: selectRoomButtonView.leadingAnchor, constant: 10),
            selectRoomButton.bottomAnchor.constraint(equalTo: selectRoomButtonView.bottomAnchor, constant: -35),
            selectRoomButton.trailingAnchor.constraint(equalTo: selectRoomButtonView.trailingAnchor, constant: -10),
        ])
    }
    
    // MARK: - Action Method
    @objc private func backEvent(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 0 이하로 스크롤할 때 애니메이션
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + hotelRoomCount + 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            // 이미지 컬렉션뷰
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: ImageCollectionView.reusableIdentifier, for: indexPath) as! ImageCollectionView
                
                return cell
            
            // 숙소 정보 (체크인, 체크아웃 포함)
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: StayRoomListTableViewCell.reusableIdentifier, for: indexPath) as! StayRoomListTableViewCell
                
                return cell
            
            // 룸 리스트
            case 2 ... (2 + hotelRoomCount):
                let cell = tableView.dequeueReusableCell(withIdentifier: RoomListTableViewCell.reusableIdentifier, for: indexPath) as! RoomListTableViewCell
                cell.roomImage.image = #imageLiteral(resourceName: "hotelImage")
                cell.roomTitle.text = "Deluxe"
                cell.roomPeople.text = "기준 \(2)명 / 최대 \(2)명"
                
                cell.rentableRoomTitle.text = "대실"
                cell.rentableRoomTimeLabel.text = "최대 \(6)시간"
                cell.rentableRoomDefaultPrice.text = "\(30000)원"
                cell.rentableRoomPercent.text = "25%"
                cell.rentableRoomPrice.text = "\(65000)"
                
                cell.stayRoomTitle.text = "숙박"
                cell.stayRoomTimeLabel.text = "최대 \(7)시간"
                cell.stayRoomDefaultPrice.text = "\(40000)원"
                cell.stayRoomPercent.text = "5%"
                cell.stayRoomPrice.text = "\(55000)"
                
                return cell
            
            // 요금 정보, 질문&답변, 이벤트 버튼
            case (2 + hotelRoomCount + 1) ... (2 + hotelRoomCount + 3):
                switch indexPath.row {
                    case (2 + hotelRoomCount + 1):
                        let cell = tableView.dequeueReusableCell(withIdentifier: StayRoomInfoTableViewCell.reusableIdentifier, for: indexPath) as! StayRoomInfoTableViewCell
                        cell.accessoryType = .disclosureIndicator
                        cell.cellTitle.text = "요금 정보"
                        
                        return cell
                    case (2 + hotelRoomCount + 2):
                        let cell = tableView.dequeueReusableCell(withIdentifier: StayRoomInfoTableViewCell.reusableIdentifier, for: indexPath) as! StayRoomInfoTableViewCell
                        cell.accessoryType = .disclosureIndicator
                        cell.cellTitle.text = "질문&답변"
                        
                        return cell
                    case (2 + hotelRoomCount + 3):
                        let cell = tableView.dequeueReusableCell(withIdentifier: StayRoomEventTableViewCell.reusableIdentifier, for: indexPath) as! StayRoomEventTableViewCell
                        
                        return cell
                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: UITableView.reusableIdentifier, for: indexPath)
                    
                    return cell
                }
            
            // 숙소 소개
            case (2 + hotelRoomCount + 4):
                let cell = tableView.dequeueReusableCell(withIdentifier: IntroduceStayTableViewCell.reusableIdentifier, for: indexPath) as! IntroduceStayTableViewCell
                
                cell.cont.text = """
                    test
                    test
                    test
                    test
                    test
                    test
                    test
                """
                
                cell.buttonAction = {
                    self.detailView.beginUpdates()
                    cell.cont.numberOfLines = 0
                    cell.moreButton.isHidden = true
                    self.detailView.endUpdates()
                }
                
                return cell
            
            // 편의시설 및 서비스
            case (2 + hotelRoomCount + 5) ... (2 + hotelRoomCount + 6):
                let cell = tableView.dequeueReusableCell(withIdentifier: ConvenienceTableViewCell.reusableIdentifier, for: indexPath) as! ConvenienceTableViewCell
            
                detailView.beginUpdates()
                
                detailView.endUpdates()
                
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: UITableView.reusableIdentifier, for: indexPath)
                
                return cell
        }
    }
}
