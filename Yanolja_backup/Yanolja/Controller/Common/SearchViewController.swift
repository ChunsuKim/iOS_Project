//
//  SearchController.swift
//  Yanolja
//
//  Created by brian은석 on 10/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

enum UISetting: CGFloat {
    case topPadding = 20
    case basicPadding = 21
    case leadingTrailingPadding = 25
    case viewHeight = 40
}

//싱글톤에 넣어서 저장해됨.. 안그럼 뷰 뜰때마다 다시 이 정보뜸.



//애니메이션에 UIViewControllerAnimatedTransitioning
// 애니메이션에는 트리거!?


// 질문 1. 스크롤뷰 위에 오토레이아웃 잡으면 위드값 안주면 트레일링 안먹힘..;;
// 질문 2. 애니메이션 이상하게 들어감..'''
// 질문 3. 
class SearchViewController: UIViewController{
    
    
    private let mainView = UIView()
    private let mainTitleLabel = UILabel()
    private let dismissButton = UIButton()
    
    private let scrollView = UIScrollView()
    var scrollViewTopAnchor :NSLayoutConstraint!
    
    //텝
    private var stackView :UIStackView!
    private let domesticButton = UIButton()
    private let foreignButton = UIButton()
    private let ticketButton = UIButton()
    private let barView = UIView()
    private var barLeading :NSLayoutConstraint!
    
    // 서치 텍스트 필드
    private let searchTextField = UITextField()
    // 서치 텍스트 필드 탑 엥커 잡아야함
    var searchTextFieldTopAnchor :NSLayoutConstraint!
    var searchTextFieldAnimateTopAnchor :NSLayoutConstraint!
    
    
     var dateLabel = UILabel()
     var numberOfPeopleLabel = UILabel()
    private var resultButton = UIButton()
    
    //최근 검색 조건
    private let recentlyLabel = UILabel()
    private let removeButton = UIButton(type: .system)
    private let mainTableView = UITableView()
    private var mainTableViewHeigtIsEmpty :NSLayoutConstraint?
    private var mainTableViewHeigt :NSLayoutConstraint?
    //추천 검색어
    private let recommendKeyWordLabel = UILabel()
    private let recommendViewFirst = RecommendView()
    private let recommendViewSecond = RecommendView()
    private let recommendViewThird = RecommendView()
    
    
    // 지하철 /.지역/숙소 버튼 누른후 나타나는 뷰들
    private let backButton = UIButton()
    private let keyWordLabel = UILabel()
    private let recentlyKeyWordLable = UILabel()
    private let allRemoveButton = UIButton(type: .system)
    private let subTableView = UITableView()
    var infoSingleTon = SingleTon.standard
    var calendarTitle :String = ""
    
    
    func mainSearchViewHiddenAndDetailSearchViewAppear() {
        let mainSearchTempArr = [mainTitleLabel,dismissButton,dateLabel,numberOfPeopleLabel,resultButton,recentlyLabel,removeButton,mainTableView,recommendKeyWordLabel,recommendViewFirst,recommendViewSecond,recommendViewThird]
        let detailSearchTempArr = [self.backButton,self.keyWordLabel,self.recentlyKeyWordLable,self.allRemoveButton,self.subTableView]
        
        mainSearchTempArr.forEach { $0.isHidden = true }
        detailSearchTempArr.forEach{$0.isHidden = false}
        
        UIView.animate(withDuration: 0.4) {
            self.scrollViewTopAnchor = self.scrollView.topAnchor.constraint(equalTo: self.mainTitleLabel.bottomAnchor)
            self.scrollViewTopAnchor.priority = .defaultHigh
            self.scrollViewTopAnchor.isActive = true
            self.searchTextFieldAnimateTopAnchor = self.searchTextField.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
            self.searchTextFieldAnimateTopAnchor.priority = .defaultHigh
            self.searchTextFieldAnimateTopAnchor.isActive = true
            
            self.view.layoutIfNeeded()

            }
        scrollView.isScrollEnabled = false
    }
    
    
    
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        //기본 뷰 색깔이 회색 그위 뷰색깔은 흰색..
        //이건 제일 밑에 넣어둠... 레이아웃만 짬
        mainUIonlyLayoutMethod()
        // 메인 UI 기능
        mainFeatUI()
        //제스쳐
        gestureAction()
     
        
        //검색 텍스트 필드 누른후!!! (detailUI)
        detailSearchUI()
//        scrollView.alwaysBounceVertical = true

    }

    func detailSearchUI() {
        let detailSearchTempArr = [backButton,keyWordLabel,recentlyKeyWordLable,allRemoveButton,subTableView]
        detailSearchTempArr.forEach{view.addSubview($0)
            view.bringSubviewToFront($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        backButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue - 3).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.setImage(UIImage(named: "dismiss"), for: .normal)
        backButton.addTarget(self, action: #selector(detailSearchBackAction), for: .touchUpInside)
        
        
        keyWordLabel.lastBaselineAnchor.constraint(equalTo: backButton.lastBaselineAnchor).isActive = true
        keyWordLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor,constant: -2).isActive = true
        keyWordLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        keyWordLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        keyWordLabel.text = "키워드 검색"
        keyWordLabel.font = UIFont.systemFont(ofSize: 20)
        
        
        recentlyKeyWordLable.topAnchor.constraint(equalTo: searchTextField.bottomAnchor,constant: UISetting.basicPadding.rawValue).isActive = true
        recentlyKeyWordLable.leadingAnchor.constraint(equalTo: backButton.leadingAnchor,constant: 10).isActive = true
        recentlyKeyWordLable.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue/2).isActive = true
        recentlyKeyWordLable.text = "최근 검색 키워드"
        recentlyKeyWordLable.font = UIFont.systemFont(ofSize: 15)
        
        
        allRemoveButton.firstBaselineAnchor.constraint(equalTo: recentlyKeyWordLable.firstBaselineAnchor).isActive = true
        allRemoveButton.trailingAnchor.constraint(equalTo: dismissButton.trailingAnchor).isActive = true
        allRemoveButton.setTitle("전체 삭제", for: .normal)
        allRemoveButton.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        
        subTableView.dataSource = self
        subTableView.register(RecentlyCustomCell.self, forCellReuseIdentifier: "subCell")
        subTableView.register(DefaultCell.self, forCellReuseIdentifier: "subDefault")
        subTableView.topAnchor.constraint(equalTo: recentlyKeyWordLable.bottomAnchor).isActive = true
        subTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        subTableView.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        subTableView.trailingAnchor.constraint(equalTo: allRemoveButton.trailingAnchor).isActive = true
        
        detailSearchTempArr.forEach{$0.isHidden = true}

    }
    
    @objc func detailSearchBackAction() {
        searchTextField.endEditing(true)
        scrollView.isScrollEnabled = true

        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: [], animations: {
            UIView.animate(withDuration: 1) {
                self.scrollViewTopAnchor.priority = .defaultLow
                self.searchTextFieldAnimateTopAnchor.priority = .defaultLow
                self.mainView.layoutIfNeeded()
                self.scrollView.layoutIfNeeded()
            }
        }) { (bool) in}
        mainSearchViewAppearAndDetailSearchViewHidden()
        scrollView.isScrollEnabled = true
    }
    
    func mainSearchViewAppearAndDetailSearchViewHidden() {
        let mainSearchTempArr = [mainTitleLabel,dismissButton,dateLabel,numberOfPeopleLabel,resultButton,recentlyLabel,removeButton,mainTableView,recommendKeyWordLabel,recommendViewFirst,recommendViewSecond,recommendViewThird]
        let detailSearchTempArr = [self.backButton,self.keyWordLabel,self.recentlyKeyWordLable,self.allRemoveButton,self.subTableView]
        
        mainSearchTempArr.forEach{$0.isHidden = false}
        detailSearchTempArr.forEach{$0.isHidden = true}

    }
 
    func gestureAction() {
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(numberOfPeopleViewAppearFunction))
        numberOfPeopleLabel.addGestureRecognizer(gesture2)
        gesture2.numberOfTapsRequired = 1

        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(calendarViewAppearFunction))
        dateLabel.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        mainView.isUserInteractionEnabled = true
    numberOfPeopleLabel.isUserInteractionEnabled = true
        
        gesture3.numberOfTapsRequired = 1
        dateLabel.addGestureRecognizer(gesture3)
    }
    
    
    @objc func calendarViewAppearFunction() {
        let vc = CalendarViewController()
        present(vc,animated: false)
    }
    @objc func numberOfPeopleViewAppearFunction() {
        
        let vc = NumberOfPeopleViewController()
        present(vc, animated: false)
    }
    
    private func mainFeatUI() {
        topUI()
        tapUI()
        
        // 지하철 숙소 텍스트 필드
        searchViewUI()
        // 캘린더
        dateViewUI()
        // 몇명
        numberOfPeopleUI()
        // 검색 결과 보기 버튼
        resultButtonUI()
        
        //최근 검색 조건 UI
        recentlySearchPointUI()
        //최근 검색조건밑 테이블 뷰
        basicTableView()
        researchedTableView()
        //추천 검색
        recommendViewUI()
    }
    
    
    private func topUI() {
        //메인뷰
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        //메인 타이틀 레이블
        mainTitleLabel.text = "검색"
        mainTitleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        // 제일 오른쪽 디스미스 버튼
        dismissButton.setImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    @objc private func dismissAction() { dismiss(animated: true, completion: nil) }
    
    private func tapUI() {
        domesticButton.isSelected = true
        domesticButton.setTitle("국내숙소", for: .normal)
        domesticButton.setTitleColor(.lightGray, for: .normal)
        domesticButton.addTarget(self, action: #selector(categoryButtonAnimateAction), for: .touchUpInside)
        domesticButton.setTitleColor(.darkGray, for: .selected)
        domesticButton.setTitle("국내숙소", for: .selected)
        domesticButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        
        
        foreignButton.setTitle("해외숙소", for: .normal)
        foreignButton.setTitleColor(.lightGray, for: .normal)
        foreignButton.setTitle("해외숙소", for: .selected)
        foreignButton.setTitleColor(.darkGray, for: .selected)
        foreignButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        foreignButton.addTarget(self, action: #selector(categoryButtonAnimateAction), for: .touchUpInside)
        
        
        ticketButton.setTitle("레저/티켓", for: .normal)
        ticketButton.setTitleColor(.lightGray, for: .normal)
        ticketButton.setTitle("레저/티켓", for: .selected)
        ticketButton.setTitleColor(.darkGray, for: .selected)
        ticketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        ticketButton.addTarget(self, action: #selector(categoryButtonAnimateAction), for: .touchUpInside)
        
        
    }
    //국내숙소 관련 애니메이션
    @objc private func categoryButtonAnimateAction(sender:UIButton) {
        domesticButton.isSelected = false
        foreignButton.isSelected = false
        ticketButton.isSelected = false
        sender.isSelected.toggle()
        
        UIView.animate(withDuration: 0.2) {
            self.barLeading.constant = sender.frame.minX
            self.barView.widthAnchor.constraint(equalTo: sender.widthAnchor).isActive = true
            //왜그러지?
            self.mainView.layoutIfNeeded()
        }
    }
    
    private func searchViewUI() {
        searchTextField.backgroundColor = #colorLiteral(red: 0.9759308696, green: 0.9800482392, blue: 0.982830584, alpha: 1)
        searchTextField.addTarget(self, action: #selector(detailSearchTextFieldTouchAction), for: .editingDidBegin)
        searchTextField.addTarget(self, action: #selector(detailSearchTextFieldDidEndEditing), for: .editingDidEnd)
        
        
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        searchTextField.placeholder = "  지역,지하철,숙소를 찾아보세요."
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spot")
        searchTextField.leftView = imageView
        searchTextField.leftView?.frame = CGRect(x: 20, y: 0, width: 50, height: 40)
        searchTextField.leftViewMode = .always
        searchTextField.layer.borderColor = #colorLiteral(red: 0.9315651655, green: 0.9356709123, blue: 0.9419475794, alpha: 1)
        searchTextField.layer.borderWidth = 2
    }
    
    @objc func detailSearchTextFieldTouchAction() {
        UIView.transition(with: mainView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.mainSearchViewHiddenAndDetailSearchViewAppear()
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    private func dateViewUI() {
        dateLabel.backgroundColor = .white
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        dateLabel.layer.borderColor = #colorLiteral(red: 0.9315651655, green: 0.9356709123, blue: 0.9419475794, alpha: 1)
        dateLabel.layer.borderWidth = 2
        
    }
    
    private func numberOfPeopleUI() {
        numberOfPeopleLabel.backgroundColor = .white
        numberOfPeopleLabel.layer.masksToBounds = true
        numberOfPeopleLabel.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        numberOfPeopleLabel.layer.borderColor = #colorLiteral(red: 0.9315651655, green: 0.9356709123, blue: 0.9419475794, alpha: 1)
        numberOfPeopleLabel.layer.borderWidth = 2
        
    }
    
    private func resultButtonUI() {
        resultButton.backgroundColor = #colorLiteral(red: 0.767136097, green: 0.7712654471, blue: 0.7779251933, alpha: 1)
        resultButton.layer.masksToBounds = true
        resultButton.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        resultButton.setTitle("검색 결과 보기", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
    }
    
    
    private func recentlySearchPointUI() {
        removeButton.setTitle("모두삭제", for: .normal)
        removeButton.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        //테이블뷰 총 5개까지만 나타남.
    }
    @objc private func removeAction() {
        infoSingleTon.recentlyArrInMainView = []
        mainTableViewHeigtIsEmpty =
            mainTableView.heightAnchor.constraint(equalToConstant: CGFloat(90))
        mainTableViewHeigtIsEmpty?.priority = .init(550)
        mainTableViewHeigtIsEmpty?.isActive = true

        mainTableView.reloadData()
    }
    
    
    private func basicTableView() {
        mainTableView.register(UINib(nibName: "RecentlyCell", bundle: nil), forCellReuseIdentifier: "cell")
        mainTableView.register(DefaultCell.self, forCellReuseIdentifier: "default")
        mainTableView.dataSource = self
    }
    
    
    private func researchedTableView() {
        mainTableView.isScrollEnabled = false
    }
    
    private func recommendViewUI() {
        recommendViewFirst.label.text = "청담역 주변 제휴점"
        recommendViewSecond.label.text = "건대입구역 주변 제휴점"
        recommendViewThird.label.text = "군자역 주변 제휴점"
    }
    //레이아웃 짠 함수코드는 제일 밑으로.
    private func mainUIonlyLayoutMethod() {
        // 제일 위
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue).isActive = true
        mainTitleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainView.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        
        
        //숙소 / 레져 버튼
        stackView = UIStackView(arrangedSubviews: [domesticButton,foreignButton,ticketButton])
        mainView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: mainView.frame.width*3/4)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = UISetting.basicPadding.rawValue
        
        mainView.addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5).isActive = true
        barLeading = barView.leadingAnchor.constraint(equalTo: domesticButton.leadingAnchor)
        barLeading.constant = 0.1
        barLeading.isActive = true
        barView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        barView.backgroundColor = .black
        barView.widthAnchor.constraint(equalTo: domesticButton.widthAnchor).isActive = true
        
        //스크롤뷰
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewTopAnchor = scrollView.topAnchor.constraint(equalTo: barView.bottomAnchor,constant: 3)
        scrollViewTopAnchor.priority = UILayoutPriority(rawValue: 350)
        scrollViewTopAnchor.isActive = true
        
        let scrollViewBottomAnchor = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        scrollViewBottomAnchor.priority = UILayoutPriority(rawValue: 350)
        scrollViewBottomAnchor.isActive = true
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        
        // 서치 텍스트 필드 (지역 숙소 찾는)
        scrollView.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextFieldTopAnchor = searchTextField.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10)
        searchTextFieldTopAnchor.priority = UILayoutPriority(rawValue: 350)
        searchTextFieldTopAnchor.isActive = true
        
        searchTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        
        
        
        
        // 캘린더 레이블
        scrollView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: UISetting.basicPadding.rawValue/2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        
        let dateImageView = UIImageView()
        dateLabel.addSubview(dateImageView)
        dateImageView.translatesAutoresizingMaskIntoConstraints = false
        dateImageView.topAnchor.constraint(equalTo: dateLabel.topAnchor,constant: 5).isActive = true
        dateImageView.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor,constant: 10).isActive = true
        dateImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dateImageView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: -5).isActive = true
        dateImageView.image = UIImage(named: "calendar")
        
        // 사람 수 레이블
        scrollView.addSubview(numberOfPeopleLabel)
        numberOfPeopleLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfPeopleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: UISetting.basicPadding.rawValue/2).isActive = true
        numberOfPeopleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        numberOfPeopleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        numberOfPeopleLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        
        let numberOfPeopleImageView = UIImageView()
        numberOfPeopleLabel.addSubview(numberOfPeopleImageView)
        numberOfPeopleImageView.translatesAutoresizingMaskIntoConstraints = false
        numberOfPeopleImageView.topAnchor.constraint(equalTo: numberOfPeopleLabel.topAnchor,constant: 5).isActive = true
        numberOfPeopleImageView.leadingAnchor.constraint(equalTo: numberOfPeopleLabel.leadingAnchor,constant: 10).isActive = true
        numberOfPeopleImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        numberOfPeopleImageView.bottomAnchor.constraint(equalTo: numberOfPeopleLabel.bottomAnchor,constant: -5).isActive = true
        numberOfPeopleImageView.image = UIImage(named: "numberOfPeople")
        
        // 결과 버튼
        scrollView.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        
        resultButton.topAnchor.constraint(equalTo: numberOfPeopleLabel.bottomAnchor, constant: UISetting.basicPadding.rawValue/2).isActive = true
        resultButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        resultButton.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        resultButton.addTarget(self, action: #selector(resultButtonColorChangeAndButtonIsNotabled) , for: .touchUpInside)
        resultButton.isEnabled = false
        
        
        
        
        // 최건 검색 조건 레이블
        recentlyLabel.text = "최근 검색 조건"
        scrollView.addSubview(recentlyLabel)
        recentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        recentlyLabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: UISetting.basicPadding.rawValue).isActive = true
        recentlyLabel.leadingAnchor.constraint(equalTo: resultButton.leadingAnchor).isActive = true
        recentlyLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue/2).isActive = true
        
        
        
        scrollView.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        removeButton.firstBaselineAnchor.constraint(equalTo: recentlyLabel.firstBaselineAnchor).isActive = true
        removeButton.trailingAnchor.constraint(equalTo: resultButton.trailingAnchor).isActive = true
        
        // 테이블 뷰
        scrollView.addSubview(mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        mainTableView.topAnchor.constraint(equalTo: recentlyLabel.bottomAnchor,constant: 5).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        mainTableView.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2) ).isActive = true
        if infoSingleTon.recentlyArrInMainView.isEmpty {
            mainTableViewHeigtIsEmpty =
            mainTableView.heightAnchor.constraint(equalToConstant: CGFloat(90))
            mainTableViewHeigtIsEmpty?.priority = .init(500)
            mainTableViewHeigtIsEmpty?.isActive = true
        } else {
            
           mainTableViewHeigt = mainTableView.heightAnchor.constraint(equalToConstant: CGFloat(infoSingleTon.recentlyArrInMainView.count * 73))
            mainTableViewHeigt?.priority = .init(500)
            mainTableViewHeigt?.isActive = true
        }
        
        
        
        
        //추천 검색어 제일 밑
        scrollView.addSubview(recommendKeyWordLabel)
        recommendKeyWordLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendKeyWordLabel.topAnchor.constraint(equalTo: mainTableView.bottomAnchor,constant: 30).isActive = true
        recommendKeyWordLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        recommendKeyWordLabel.text = "추천검색어"
        
        // 추천 검색어!!!레이블?
        scrollView.addSubview(recommendViewFirst)
        recommendViewFirst.translatesAutoresizingMaskIntoConstraints = false
        recommendViewFirst.topAnchor.constraint(equalTo: recommendKeyWordLabel.bottomAnchor,constant: 15).isActive = true
        recommendViewFirst.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        
        scrollView.addSubview(recommendViewSecond)
        recommendViewSecond.translatesAutoresizingMaskIntoConstraints = false
        recommendViewSecond.topAnchor.constraint(equalTo: recommendViewFirst.bottomAnchor,constant: 5).isActive = true
        recommendViewSecond.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        
        scrollView.addSubview(recommendViewThird)
        recommendViewThird.translatesAutoresizingMaskIntoConstraints = false
        recommendViewThird.topAnchor.constraint(equalTo: recommendViewSecond.bottomAnchor,constant: 5).isActive = true
        recommendViewThird.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        
        recommendViewThird.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    @objc func resultButtonColorChangeAndButtonIsNotabled() {
        resultButton.backgroundColor = #colorLiteral(red: 0.767136097, green: 0.7712654471, blue: 0.7779251933, alpha: 1)
        resultButton.isEnabled = false
    }
    
    @objc func detailSearchTextFieldDidEndEditing() {
        if searchTextField.text != "" {
        resultButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            resultButton.isEnabled = true
        }
        
    }
    
    
}
extension SearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.mainTableView {
            if infoSingleTon.recentlyArrInMainView.count == 0 {
                return 1
            } else {
                return infoSingleTon.recentlyArrInMainView.count
            }
        } else {
            if infoSingleTon.recentlyArrInDetailView.count == 0 {
                return 1
            } else {
                return infoSingleTon.recentlyArrInDetailView.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.mainTableView {
            if infoSingleTon.recentlyArrInMainView.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! DefaultCell
                // 셀라인 삭제
                tableView.separatorStyle = .none
                tableView.allowsSelection = false
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentlyCell
                
                cell.search = infoSingleTon.recentlyArrInMainView[indexPath.row]
                return cell
            }
            
        } else {
            if infoSingleTon.recentlyArrInDetailView.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subDefault", for: indexPath) as! DefaultCell
                tableView.rowHeight = 300
        //셀 선택 안되게..
                tableView.allowsSelection = false
                // 셀라인 삭제
                tableView.separatorStyle = .none
                tableView.isScrollEnabled = false
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as! RecentlyCustomCell
                cell.search = infoSingleTon.recentlyArrInDetailView[indexPath.row]
                tableView.isScrollEnabled = true

                return cell
            }
        }
    }

}

