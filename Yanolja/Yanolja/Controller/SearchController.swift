//
//  SearchController.swift
//  Yanolja
//
//  Created by brian은석 on 10/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

private enum UISetting: CGFloat {
    case padding = 30
    case leadingTrailingPadding = 25
    case viewHeight = 50
}



class SearchController: UIViewController {
    
    private let mainView = UIView()
    private let mainTitleLabel = UILabel()
    private let scrollView = UIScrollView()
    
    //텝
    private let domesticButton = UIButton()
    private let foreignButton = UIButton()
    private let ticketButton = UIButton()
    private let barView = UIView()
    private var barLeading :NSLayoutConstraint!
    
    // 서치 텍스트 필드
    private let searchTextField = UITextField()
    private var dateLabel = UILabel()
    private var numberOfPeopleLabel = UILabel()
    private var resultButton = UIButton()
    
    //최근 검색 조건
    private let recentlyLabel = UILabel()
    private let removeButton = UIButton(type: .system)
    private let serchView = SearchView()
    
    
    
    
    //뭔가 스트럭트 만들어서 넣어야될듯???
    private var recentlyArr:[SearchClass] = [SearchClass(searchPointName: "노원역", date: "7월7일 ~ 7월 12일", adultsNumber: 2, kidsNumber: 1), SearchClass(searchPointName: "건대", date: "7월17일 ~ 7월 22일", adultsNumber: 3, kidsNumber: 0), SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3),SearchClass(searchPointName: "성수역", date: "7월27일 ~ 7월 30일", adultsNumber: 3, kidsNumber: 3)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        topUI()
        tapUI()
        
        searchViewUI()
        dateViewUI()
        numberOfPeopleUI()
        resultButtonUI()
        recentlySearchPointUI()
        createView()
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        
        //제스쳐
        gestureAction()
        
        
    }
    
    func gestureAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(a))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(b))
        gesture.numberOfTouchesRequired = 1
        searchTextField.addGestureRecognizer(gesture)
        dateLabel.isUserInteractionEnabled = true
        scrollView.addGestureRecognizer(gesture2)
        //        mainView.addGestureRecognizer(gesture2)
        gesture2.numberOfTapsRequired = 1
        scrollView.isUserInteractionEnabled = true
        mainView.isUserInteractionEnabled = true
    }
    
    @objc func a() {
        let vc = KeyWordViewController()
        present(vc, animated: false, completion: nil)
        print("dateLabel 선택한순간 present view 띄울예정")
    }
    @objc func b() {
        self.scrollView.endEditing(true)
    }
    
    
    
    var searchViews = [SearchView]()
    func createView() {
        for i in recentlyArr {
            let tempView = SearchView()
            tempView.set(data: i)
            scrollView.addSubview(tempView)
            searchViews.append(tempView)
            tempView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for i in searchViews.enumerated() {
            if i.offset == 0 {
                i.element.topAnchor.constraint(equalTo: recentlyLabel.bottomAnchor,constant: 5).isActive = true
                i.element.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
                i.element.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
                i.element.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2) ).isActive = true
                i.element.heightAnchor.constraint(equalToConstant: 80).isActive = true
            } else if i.offset != searchViews.count - 1 {
                i.element.topAnchor.constraint(equalTo: searchViews[(i.offset - 1)].bottomAnchor).isActive = true
                i.element.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
                i.element.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
                i.element.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2) ).isActive = true
                i.element.heightAnchor.constraint(equalToConstant: 80).isActive = true
                
            } else {
                i.element.topAnchor.constraint(equalTo: searchViews[(i.offset - 1)].bottomAnchor).isActive = true
                i.element.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
                i.element.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
                i.element.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2) ).isActive = true
                i.element.heightAnchor.constraint(equalToConstant: 80).isActive = true
                i.element.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            }
        }
        
    }
    
    private func topUI() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.padding.rawValue).isActive = true
        
        mainTitleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        
        mainTitleLabel.text = "검색"
        mainTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        let dismissButton = UIButton()
        mainView.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.padding.rawValue).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        dismissButton.setImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.backgroundColor = .white
        
        
        
    }
    @objc private func dismissAction() { dismiss(animated: true, completion: nil) }
    
    private func tapUI() {
        domesticButton.isSelected = true
        domesticButton.setTitle("국내숙소", for: .normal)
        domesticButton.setTitleColor(.lightGray, for: .normal)
        domesticButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        domesticButton.setTitleColor(.darkGray, for: .selected)
        domesticButton.setTitle("국내숙소", for: .selected)
        domesticButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        foreignButton.setTitle("해외숙소", for: .normal)
        foreignButton.setTitleColor(.lightGray, for: .normal)
        foreignButton.setTitle("해외숙소", for: .selected)
        foreignButton.setTitleColor(.darkGray, for: .selected)
        foreignButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        foreignButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        
        
        ticketButton.setTitle("레저/티켓", for: .normal)
        ticketButton.setTitleColor(.lightGray, for: .normal)
        ticketButton.setTitle("레저/티켓", for: .selected)
        ticketButton.setTitleColor(.darkGray, for: .selected)
        ticketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        ticketButton.addTarget(self, action: #selector(infor), for: .touchUpInside)
        
        
        
        let stackView = UIStackView(arrangedSubviews: [domesticButton,foreignButton,ticketButton])
        mainView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor,constant: UISetting.padding.rawValue/3).isActive = true
        stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        //        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: mainView.frame.width*3/4)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = UISetting.padding.rawValue
        
        mainView.addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5).isActive = true
        barLeading = barView.leadingAnchor.constraint(equalTo: domesticButton.leadingAnchor)
        barLeading.constant = 0.1
        barLeading.isActive = true
        barView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        barView.backgroundColor = .black
        barView.widthAnchor.constraint(equalTo: domesticButton.widthAnchor).isActive = true
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
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: UISetting.padding.rawValue/2).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        
        searchTextField.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        
        //        searchTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        searchTextField.placeholder = "지역,지하철,숙소를 찾아보세요."
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spot")
        searchTextField.leftView = imageView
        searchTextField.leftView?.frame = CGRect(x: 20, y: 0, width: 60, height: 60)
        searchTextField.leftViewMode = .always
    }
    
    private func dateViewUI() {
        dateLabel.backgroundColor = #colorLiteral(red: 0.9759308696, green: 0.9800482392, blue: 0.982830584, alpha: 1)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: UISetting.padding.rawValue/2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        
    }
    
    private func numberOfPeopleUI() {
        numberOfPeopleLabel.backgroundColor = #colorLiteral(red: 0.9759308696, green: 0.9800482392, blue: 0.982830584, alpha: 1)
        numberOfPeopleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(numberOfPeopleLabel)
        numberOfPeopleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: UISetting.padding.rawValue/2).isActive = true
        numberOfPeopleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        numberOfPeopleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        numberOfPeopleLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        numberOfPeopleLabel.layer.masksToBounds = true
        numberOfPeopleLabel.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        
    }
    
    private func resultButtonUI() {
        resultButton.backgroundColor = #colorLiteral(red: 0.767136097, green: 0.7712654471, blue: 0.7779251933, alpha: 1)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(resultButton)
        resultButton.topAnchor.constraint(equalTo: numberOfPeopleLabel.bottomAnchor, constant: UISetting.padding.rawValue/2).isActive = true
        resultButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        resultButton.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        resultButton.layer.masksToBounds = true
        resultButton.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        resultButton.setTitle("검색 결과 보기", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
    }
    
    
    
    private func recentlySearchPointUI() {
        recentlyLabel.text = "최근 검색 조건"
        recentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(recentlyLabel)
        recentlyLabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: UISetting.padding.rawValue).isActive = true
        recentlyLabel.leadingAnchor.constraint(equalTo: resultButton.leadingAnchor).isActive = true
        
        recentlyLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue/2).isActive = true
        
        scrollView.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        removeButton.firstBaselineAnchor.constraint(equalTo: recentlyLabel.firstBaselineAnchor).isActive = true
        removeButton.trailingAnchor.constraint(equalTo: resultButton.trailingAnchor).isActive = true
        removeButton.setTitle("모두삭제", for: .normal)
        removeButton.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        //테이블뷰 총 5개까지만 나타남.
        
        
    }
    @objc private func removeAction() {
        recentlyArr = []
        
    }
    
    
    
    
}
