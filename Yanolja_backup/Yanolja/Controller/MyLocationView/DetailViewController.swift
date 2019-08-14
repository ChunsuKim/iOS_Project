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
    
    var listSenderData = [StayDetailElement]() {
        didSet {
            self.topCellCount = 2
            self.hotelRoomCount = roomListData.count - 2
            self.bottomCellCount = 8
            detailTableView.reloadData()
            
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    var roomListData = [StayDetailRoomElement]() {
        didSet {
            detailTableView.reloadData()
            
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    let customTab = CustomTabBarController()
    
    var hotelRoomCount = 0
    var topCellCount = 0
    var bottomCellCount = 0
    
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isHidden = true
        
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
    
    let detailTableView: UITableView = {
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
        detailTableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(detailTableView)
        
        view.addSubview(activityIndicatorView)
        
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
        
        fetchDetailData()
        // FIXME: - 뷰윌 어피어라... 시점 찾자
        detailTableView.reloadData()
    }
    
    private func fetchDetailData() {
        WebAPI.shared.locationStayAPI(stayId: singleTon.stayID) { (response) in
            
            self.listSenderData = [response]
        }
        
        WebAPI.shared.roomListApi(stayId: singleTon.stayID) { (result) in
            self.roomListData = result
        }
    }
    
    // MARK: - Configure DetailView
    private func configureDetailView() {
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        // collectionView safeArea 무시
        detailTableView.contentInsetAdjustmentBehavior = .never
        
        // imageCollectionView cell
        detailTableView.register(ImageCollectionView.self, forCellReuseIdentifier: ImageCollectionView.reusableIdentifier)
        
        // info stayRoom cell
        detailTableView.register(StayRoomListTableViewCell.self, forCellReuseIdentifier: StayRoomListTableViewCell.reusableIdentifier)
        
        // RoomList cell
        detailTableView.register(RoomListTableViewCell.self, forCellReuseIdentifier: RoomListTableViewCell.reusableIdentifier)
        
        // 요금정보, 질문&답변 cell
        detailTableView.register(StayRoomInfoTableViewCell.self, forCellReuseIdentifier: StayRoomInfoTableViewCell.reusableIdentifier)
        
        // 이벤트 cell
        detailTableView.register(StayRoomEventTableViewCell.self, forCellReuseIdentifier: StayRoomEventTableViewCell.reusableIdentifier)
        
        // 숙소 소개 cell
        detailTableView.register(IntroduceStayTableViewCell.self, forCellReuseIdentifier: IntroduceStayTableViewCell.reusableIdentifier)
        
        // 편의 시설 cell
        detailTableView.register(ConvenienceTableViewCell.self, forCellReuseIdentifier: ConvenienceTableViewCell.reusableIdentifier)
        
        // 이용안내 cell
        detailTableView.register(ServiceNoticeTableViewCell.self, forCellReuseIdentifier: ServiceNoticeTableViewCell.reusableIdentifier)
        
        // 지도
        detailTableView.register(MapTableViewCell.self, forCellReuseIdentifier: MapTableViewCell.reusableIdentifier)
    }
    
    // MARK: - Configure Constraints
    private func configureConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 50),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 50),
            
            topNaviCustom.topAnchor.constraint(equalTo: view.topAnchor),
            topNaviCustom.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topNaviCustom.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            topNaviCustom.heightAnchor.constraint(equalToConstant: 100),
            backButton.leadingAnchor.constraint(equalTo: topNaviCustom.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: topNaviCustom.bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            stayNaviTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            stayNaviTitle.centerXAnchor.constraint(equalTo: topNaviCustom.centerXAnchor),
            stayNaviTitle.heightAnchor.constraint(equalToConstant: 20),
            stayNaviTitle.widthAnchor.constraint(equalTo: topNaviCustom.widthAnchor, multiplier: 0.3),
            favoriteButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            shareButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: topNaviCustom.trailingAnchor, constant: -20),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20),
            
            detailTableView.topAnchor.constraint(equalTo: view.topAnchor),
            detailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailTableView.bottomAnchor.constraint(equalTo: selectRoomButtonView.topAnchor),
            
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
        if scrollView.contentOffset.y > 200 {
            UIView.animate(withDuration: 0.3) {
                self.topNaviCustom.backgroundColor = .white
                self.backButton.tintColor = .black
                self.stayNaviTitle.isHidden = false
                self.favoriteButton.tintColor = .black
                self.shareButton.tintColor = .black
            }
            //            topNaviCustom
        } else {
            UIView.animate(withDuration: 0.3) {
                self.topNaviCustom.backgroundColor = .clear
                self.backButton.tintColor = .white
                self.stayNaviTitle.isHidden = true
                self.favoriteButton.tintColor = .white
                self.shareButton.tintColor = .white
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            present(CalendarViewController(), animated: true)
        case 2 ... (2 + hotelRoomCount):
            print("!!!! :", roomListData[indexPath.row - 2].roomID)
            singleTon.roomID = roomListData[indexPath.row - 2].roomID
            present(RoomDetailViewController(), animated: true, completion: nil)
        //            show(RoomDetailViewController(), sender: nil)
        default:
            print(1)
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topCellCount + hotelRoomCount + bottomCellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        // 이미지 컬렉션뷰
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCollectionView.reusableIdentifier, for: indexPath) as! ImageCollectionView
            cell.saveImageList = roomListData.first?.urlImage ?? []
            return cell
            
        // 숙소 정보 (체크인, 체크아웃 포함)
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: StayRoomListTableViewCell.reusableIdentifier, for: indexPath) as! StayRoomListTableViewCell
            cell.fetchStayData(name: listSenderData[0].name, averageGrade: listSenderData[0].averageGrade, totalComment: listSenderData[0].totalComments, ownerComments: listSenderData[0].ownerComments, directions: listSenderData[0].directions)
            
            return cell
            
        // 룸 리스트
        case 2 ... (2 + hotelRoomCount):
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomListTableViewCell.reusableIdentifier, for: indexPath) as! RoomListTableViewCell
            
            if roomListData[indexPath.row - 2].hoursPrice == "0" {
               roomListData[indexPath.row - 2].hoursPrice = "예약완료"
            }
            
            if roomListData[indexPath.row - 2].daysPrice == "0" {
                roomListData[indexPath.row - 2].daysPrice = "예약완료"
            }
            
            cell.fetchRoomListData(name: roomListData[indexPath.row - 2].name, standardPersonnel: roomListData[indexPath.row - 2].standardPersonnel, maximumPersonnel: roomListData[indexPath.row - 2].maximumPersonnel, hoursAvailable: roomListData[indexPath.row - 2].hoursAvailable, daysCheckIn: roomListData[indexPath.row - 2].daysCheckIn, hoursPrice: roomListData[indexPath.row - 2].hoursPrice, saleHoursPrice: roomListData[indexPath.row - 2].saleHoursPrice, daysPrice: roomListData[indexPath.row - 2].daysPrice, saleDaysPrice: roomListData[indexPath.row - 2].saleDaysPrice, basicInfo: roomListData[indexPath.row - 2].basicInfo, urlImage: roomListData[indexPath.row - 2].urlImage[0])
//            cell.roomImage.image = roomListData[indexPath.row - 2].urlImage[0]
    
            cell.roomPeople.text = "기준 \(2)명 / 최대 \(2)명"
            
            cell.rentableRoomTitle.text = "대실"
            cell.rentableRoomPercent.text = String(Int((Double(roomListData[indexPath.row - 2].daysPrice)!-Double(roomListData[indexPath.row - 2].saleDaysPrice)!)/Double(roomListData[indexPath.row - 2].daysPrice)! * 100)) + "%~"
            
            cell.stayRoomTitle.text = "숙박"
            cell.stayRoomPercent.text = "5%"
//            cell.stayRoomPercent.text = String(Int((Double(roomListData[indexPath.row - 2].hoursPrice)!-Double(roomListData[indexPath.row - 2].saleHoursPrice)!)/Double(roomListData[indexPath.row - 2].hoursPrice)! * 100)) + "%~"
            
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
            
            for i in 0..<listSenderData[0].introduce.count {
                
                cell.cont.text = listSenderData[0].introduce[i]
            }
            
            cell.buttonAction = {
                self.detailTableView.beginUpdates()
                cell.cont.numberOfLines = 0
                cell.moreButton.isHidden = true
                self.detailTableView.endUpdates()
            }
            
            return cell
            
        // 편의시설 및 서비스
        case (2 + hotelRoomCount + 5):
            let cell = tableView.dequeueReusableCell(withIdentifier: ConvenienceTableViewCell.reusableIdentifier, for: indexPath) as! ConvenienceTableViewCell
            
            cell.cont.text = """
            \("﹒") 트윈베드 객실 보유(싱글침대 + 더블침대)
            \("﹒") (디럭스 1호라인 커플 PC)
            \("﹒") 무료 Wi-Fi(설치(1대 설치)
            \("﹒") 전 객실 고급 에이스침대 설치
            \("﹒") 디럭스 이상 월풀 욕조 및 소프트 욕조 설치
            \("﹒") 전 객실 SK 셋탑박스 설치
            \("﹒") 객실 당 차량 1대만 주차 가능
            \("﹒") 30대 이상 대규모 주차장 완비, 발렛파킹 가능
            \("﹒") 주차는 입실과 동시에 가능하고 퇴실시 주차는 불가
            \("﹒") 무료 주차
            """
            
            return cell
            
        // 이용안내
        case (2 + hotelRoomCount + 6):
            let cell = tableView.dequeueReusableCell(withIdentifier: ServiceNoticeTableViewCell.reusableIdentifier, for: indexPath) as! ServiceNoticeTableViewCell
            cell.cont.text = """
            \("﹒") 2인 이상 객실 이용안내
            \("﹒") Twin(Double + Single) 2인기준, 최대 3인까지 이용가능
            \("﹒") 호텔 내규상 혼숙은 금하고 있으니 이점 양해 부탁드립니다
            \("﹒") 촛불 및 풍선이벤트는 되지 않습니다
            """
            
            return cell
        case (2 + hotelRoomCount + 7):
            let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.reusableIdentifier, for: indexPath) as! MapTableViewCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableView.reusableIdentifier, for: indexPath)
            
            return cell
        }
    }
}
