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

//애니메이션에 UIViewControllerAnimatedTransitioning
// 애니메이션에는 트리거!?

class SearchController: UIViewController{
    
    
    
    private let mainView = UIView()
    private let mainTitleLabel = UILabel()
    private let dismissButton = UIButton()

    private let scrollView = UIScrollView()
    var scrollViewTopAnchor :NSLayoutConstraint!
    var scrollViewAnimateTopAnchor :NSLayoutConstraint!

    var scrollViewBottomAnchor :NSLayoutConstraint!

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
    
    
    private var dateLabel = UILabel()
    private var numberOfPeopleLabel = UILabel()
    private var resultButton = UIButton()
    
    //최근 검색 조건
    private let recentlyLabel = UILabel()
    private let removeButton = UIButton(type: .system)
    private let tableView = UITableView()
    
    //추천 검색어
    private let recommendKeyWordLabel = UILabel()
    private let recommendViewFirst = RecommendView()
    private let recommendViewSecond = RecommendView()
    private let recommendViewThird = RecommendView()
    
    
    // 지하철 /.지역/숙소 버튼 누른후 나타나는 뷰들
    private let backButton = UIButton()
    private let keyWordLabel = UILabel()
    private let recentlyKeyWordLable = UILabel()
    private let allRemoveButton = UIButton()
    

    func keyWordUIAppearFunc() {
        let tempArr = [mainTitleLabel,dismissButton,dateLabel,numberOfPeopleLabel,resultButton,recentlyLabel,removeButton,tableView,recommendKeyWordLabel,recommendViewFirst,recommendViewSecond,recommendViewThird]
        tempArr.map{$0.isHidden = true}
        let temp = [self.backButton,self.keyWordLabel,self.recentlyKeyWordLable,self.allRemoveButton]
        temp.map{$0.isHidden = false}
        
        UIView.animate(withDuration: 0.4) {
            self.scrollViewAnimateTopAnchor = self.scrollView.topAnchor.constraint(equalTo: self.mainTitleLabel.bottomAnchor)
            self.scrollViewAnimateTopAnchor.priority = .defaultHigh
            self.scrollViewAnimateTopAnchor.isActive = true
            self.searchTextFieldAnimateTopAnchor = self.searchTextField.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
            self.searchTextFieldAnimateTopAnchor.priority = .defaultHigh
            self.searchTextFieldAnimateTopAnchor.isActive = true
            
            self.view.layoutIfNeeded()
        }
    }
    
    func dismissAndAppearFunc() {
        
    }
    
    
    
    
    //뭔가 스트럭트 만들어서 넣어야될듯???
    private var recentlyArr:[SearchClass] = []
    //        [SearchClass(searchPointName: "노원역", date: "7월7일 ~ 7월 12일", adultsNumber: 2, kidsNumber: 1), SearchClass(searchPointName: "건대", date: "7월17일 ~ 7월 22일", adultsNumber: 3, kidsNumber: 0), SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //기본 뷰 색깔이 회색 그위 뷰색깔은 흰색..
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        //이건 제일 밑에 넣어둠... 레이아웃만 짬
        onlyLayoutMethod()
        
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
        //제스쳐
        gestureAction()
        //최근 검색조건밑 테이블 뷰
        basicTableView()
        researchedTableView()
        //추천 검색
        recommendViewUI()
        
        //검색 텍스트 필드 누른후!!!
        keyWordUI()
    }
   
    
    func keyWordUI() {
        let temp = [backButton,keyWordLabel,recentlyKeyWordLable,allRemoveButton]
        for x in temp {
            view.addSubview(x)
            x.translatesAutoresizingMaskIntoConstraints = false
        }
        
        backButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue - 3).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.setImage(UIImage(named: "dismiss"), for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        
//        keyWordLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue).isActive = true
        keyWordLabel.lastBaselineAnchor.constraint(equalTo: backButton.lastBaselineAnchor).isActive = true
        keyWordLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor,constant: -2).isActive = true
        keyWordLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        keyWordLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        keyWordLabel.text = "키워드 검색"
        keyWordLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        recentlyKeyWordLable.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.basicPadding.rawValue).isActive = true
        recentlyKeyWordLable.leadingAnchor.constraint(equalTo: dismissButton.trailingAnchor).isActive = true
        recentlyKeyWordLable.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue/2).isActive = true
        
        
        
        allRemoveButton.translatesAutoresizingMaskIntoConstraints = false
        
        allRemoveButton.firstBaselineAnchor.constraint(equalTo: recentlyKeyWordLable.firstBaselineAnchor).isActive = true
        allRemoveButton.trailingAnchor.constraint(equalTo: dismissButton.trailingAnchor).isActive = true
        allRemoveButton.setTitle("전체 삭제", for: .normal)
        allRemoveButton.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        
        
        temp.map{$0.isHidden = true}
    }
    
    @objc func backAction() {
        searchTextField.endEditing(true)

        let tempArr = [mainTitleLabel,dismissButton,dateLabel,numberOfPeopleLabel,resultButton,recentlyLabel,removeButton,tableView,recommendKeyWordLabel,recommendViewFirst,recommendViewSecond,recommendViewThird]
       
        let temp = [self.backButton,self.keyWordLabel,self.recentlyKeyWordLable,self.allRemoveButton]
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.animate(withDuration: 0.4) {
              
                
                self.scrollViewAnimateTopAnchor.priority = .defaultLow
                self.searchTextFieldAnimateTopAnchor.priority = .defaultLow
                
                self.mainView.layoutIfNeeded()
                self.scrollView.layoutIfNeeded()
            }
        }) { (bool) in
            tempArr.map{$0.isHidden = false}
            temp.map{$0.isHidden = true}
            self.scrollView.layoutIfNeeded()
        }
        
        
        
        
    }
    

    func gestureAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(a))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(b))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(c))
        gesture.numberOfTouchesRequired = 1
        searchTextField.addGestureRecognizer(gesture)
        dateLabel.isUserInteractionEnabled = true
        scrollView.addGestureRecognizer(gesture2)
        //        mainView.addGestureRecognizer(gesture2)
        gesture2.numberOfTapsRequired = 1
        scrollView.isUserInteractionEnabled = true
        mainView.isUserInteractionEnabled = true
        
        gesture3.numberOfTapsRequired = 1
        dateLabel.addGestureRecognizer(gesture3)
    }
    
    @objc func a() {
        
        UIView.transition(with: mainView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.keyWordUIAppearFunc()
            self.mainView.layoutIfNeeded()
        }, completion: nil)
      
       
    }
    @objc func b() {
//        self.scrollView.endEditing(true)
    }
    @objc func c() {
        let vc = CalendarViewController()
        present(vc,animated: false)
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
        domesticButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        domesticButton.setTitleColor(.darkGray, for: .selected)
        domesticButton.setTitle("국내숙소", for: .selected)
        domesticButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        
        
        foreignButton.setTitle("해외숙소", for: .normal)
        foreignButton.setTitleColor(.lightGray, for: .normal)
        foreignButton.setTitle("해외숙소", for: .selected)
        foreignButton.setTitleColor(.darkGray, for: .selected)
        foreignButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        foreignButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        
        
        ticketButton.setTitle("레저/티켓", for: .normal)
        ticketButton.setTitleColor(.lightGray, for: .normal)
        ticketButton.setTitle("레저/티켓", for: .selected)
        ticketButton.setTitleColor(.darkGray, for: .selected)
        ticketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        ticketButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        
        
        
      
//        barView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        
    
    }
    //국내숙소 관련 애니메이션
    @objc private func infor(sender:UIButton) {
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
     
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        searchTextField.placeholder = "지역,지하철,숙소를 찾아보세요."
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spot")
        searchTextField.leftView = imageView
        searchTextField.leftView?.frame = CGRect(x: 20, y: 0, width: 40, height: 40)
        searchTextField.leftViewMode = .always
    }
    
    private func dateViewUI() {
        dateLabel.backgroundColor = #colorLiteral(red: 0.9759308696, green: 0.9800482392, blue: 0.982830584, alpha: 1)
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        
    }
    
    private func numberOfPeopleUI() {
        numberOfPeopleLabel.backgroundColor = #colorLiteral(red: 0.9759308696, green: 0.9800482392, blue: 0.982830584, alpha: 1)
        numberOfPeopleLabel.layer.masksToBounds = true
        numberOfPeopleLabel.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        
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
        recentlyArr = []
    }
    
    
    private func basicTableView() {
        tableView.register(UINib(nibName: "RecentlyCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "defaultCell", bundle: nil), forCellReuseIdentifier: "default")
        tableView.dataSource = self
    }
    
    
    private func researchedTableView() {
        tableView.isScrollEnabled = false
    }
    
    private func recommendViewUI() {
        recommendViewFirst.label.text = "청담역 주변 제휴점"
        recommendViewSecond.label.text = "건대입구역 주변 제휴점"
        recommendViewThird.label.text = "군자역 주변 제휴점"
    }
   //레이아웃 짠 함수코드는 제일 밑으로.
    private func onlyLayoutMethod() {
        // 제일 위
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        
        // 서치 텍스트 필드 (지역 숙소 찾는)
        scrollView.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextFieldTopAnchor = searchTextField.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10)
        searchTextFieldTopAnchor.priority = UILayoutPriority(rawValue: 350)
        searchTextFieldTopAnchor.isActive = true
        
        searchTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        // 캘린더 레이블
        scrollView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: UISetting.basicPadding.rawValue/2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        
        // 사람 수 레이블
        scrollView.addSubview(numberOfPeopleLabel)
        numberOfPeopleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numberOfPeopleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: UISetting.basicPadding.rawValue/2).isActive = true
        numberOfPeopleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        numberOfPeopleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        numberOfPeopleLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        
        // 결과 버튼
        scrollView.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        
        resultButton.topAnchor.constraint(equalTo: numberOfPeopleLabel.bottomAnchor, constant: UISetting.basicPadding.rawValue/2).isActive = true
        resultButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        resultButton.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        
        // 최건 검색 조건 레이블
        recentlyLabel.text = "최근 검색 조건"
        recentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(recentlyLabel)
        recentlyLabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: UISetting.basicPadding.rawValue).isActive = true
        recentlyLabel.leadingAnchor.constraint(equalTo: resultButton.leadingAnchor).isActive = true
        
        recentlyLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue/2).isActive = true
        
        scrollView.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        removeButton.firstBaselineAnchor.constraint(equalTo: recentlyLabel.firstBaselineAnchor).isActive = true
        removeButton.trailingAnchor.constraint(equalTo: resultButton.trailingAnchor).isActive = true
        
        // 테이블 뷰
        scrollView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: recentlyLabel.bottomAnchor,constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2) ).isActive = true
        if recentlyArr.isEmpty {
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        } else {
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(recentlyArr.count * 90)).isActive = true
        }
        tableView.rowHeight = 90
        
        //추천 검색어 제일 밑
        scrollView.addSubview(recommendKeyWordLabel)
        recommendKeyWordLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendKeyWordLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 30).isActive = true
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

}
extension SearchController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recentlyArr.count == 0 {
            return 1
        } else {
            return recentlyArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if recentlyArr.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! defaultCell
            // 셀라인 삭제
            tableView.separatorStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentlyCell
            cell.search = recentlyArr[indexPath.row]
            return cell
        }
        
    }
    
    
}




