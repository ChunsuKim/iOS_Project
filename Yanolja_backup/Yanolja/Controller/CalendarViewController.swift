//
//  CalendarViewController.swift
//  Yanolja
//
//  Created by brian은석 on 16/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    
    private let mainView = UIView()
    private let backButton = UIButton()
    private let mainTitleLabel = UILabel()
    private let scrollView = UIScrollView()
    private let removeButton = UIButton(type: .system)
    let sundayLabel = UILabel()
    
    
    var calendar = FSCalendar(frame: .zero)
    var calendarHeightConstraint: NSLayoutConstraint?
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    private let date = Date()
    
    private let bottomCheckInSearchButton = UIButton()
    
    let defaultCal = Calendar(identifier: .gregorian)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        
        configureUI()
        calenderFeat()
        calendar.placeholderType = .none

    }
    private func configureUI() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        
        mainView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue - 3).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.setImage(UIImage(named: "dismiss"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.lastBaselineAnchor.constraint(equalTo: backButton.lastBaselineAnchor).isActive = true
        mainTitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor,constant: -2).isActive = true
        mainTitleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainTitleLabel.text = "날짜선택"
        mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        mainView.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20).isActive = true
        
        removeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        removeButton.setTitle("초기화", for: .normal)
        removeButton.addTarget(self, action: #selector(removeAll), for: .touchUpInside)
        removeButton.isEnabled = false
        
        let mondayLabel = UILabel()
        let tuedayLabel = UILabel()
        let weddayLabel = UILabel()
        let thudayLabel = UILabel()
        let fridayLabel = UILabel()
        let satdayLabel = UILabel()
        
        sundayLabel.text = "일"
        sundayLabel.textColor = .red
        
        mondayLabel.text = "월"
        //        mondayLabel.textColor = .black
        tuedayLabel.text = "화"
        weddayLabel.text = "수"
        thudayLabel.text = "목"
        fridayLabel.text = "금"
        satdayLabel.text = "토"
        satdayLabel.textColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [sundayLabel,mondayLabel,tuedayLabel,weddayLabel,thudayLabel,fridayLabel,satdayLabel])
        mainView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -25).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        mainView.addSubview(calendar)
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: sundayLabel.bottomAnchor,constant: -20).isActive = true
        calendar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        calendar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        mainView.addSubview(bottomCheckInSearchButton)
        bottomCheckInSearchButton.translatesAutoresizingMaskIntoConstraints = false
        bottomCheckInSearchButton.topAnchor.constraint(equalTo: calendar.bottomAnchor,constant: 3).isActive = true
        bottomCheckInSearchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomCheckInSearchButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 10).isActive = true
        bottomCheckInSearchButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -10).isActive = true
        bottomCheckInSearchButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant: -40).isActive = true
        bottomCheckInSearchButton.backgroundColor = .lightGray
        bottomCheckInSearchButton.setTitle("날짜를 선택해 주세요.", for: .normal)
        bottomCheckInSearchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        bottomCheckInSearchButton.setTitleColor(.white, for: .normal)
        bottomCheckInSearchButton.layer.cornerRadius = 25
        bottomCheckInSearchButton.isEnabled = false
        bottomCheckInSearchButton.addTarget(self, action: #selector(sendDate), for: .touchUpInside)

    }
    @objc private func removeAll() {
        for _ in 0 ..< calendar.selectedDates.count {
            calendar.deselect(calendar.selectedDates[0])
        }
        bottomCheckInSearchButton.setTitle("날짜를 선택해 주세요.", for: .normal)
        bottomCheckInSearchButton.backgroundColor = .lightGray
        bottomCheckInSearchButton.isEnabled = false
        removeButton.isEnabled = false

    }
    @objc private func sendDate() {
        guard let vc = presentingViewController as? SearchViewController else { return }
        vc.dismiss(animated: true) {
            guard let title = self.bottomCheckInSearchButton.currentTitle else {return}
            vc.dateLabel.text = title
        }
    }
    
    private func calenderFeat() {
        calendar.delegate = self
        calendar.dataSource = self
        //        calendar.appearance.headerTitleColor = .clear
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 19, weight: .thin)
        calendar.appearance.headerTitleColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        calendar.weekdayHeight = 0
        //        calendar.locale = Locale(identifier: "ko")
        
        calendar.scrollDirection = .vertical
        calendar.pagingEnabled = false
        calendar.setCurrentPage(date, animated: false)
        
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        self.calendar.select(self.formatter.date(from:"\(date)"))
        
        let scopeGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        self.calendar.addGestureRecognizer(scopeGesture)
        
        // For UITest
        self.calendar.accessibilityIdentifier = "calendar"
        calendar.allowsMultipleSelection = true
    }
    
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil) }
    
    func day(of:Int) -> String {
        switch of {
        case 2: return "월"
        case 3: return "화"
        case 4: return "수"
        case 5: return "목"
        case 6: return "금"
        case 7: return "토"
        default:return "일"
        }
    }
    // MARK: 코드 너무드러워 이 함수코드는 bottomCheckInSearchButton 의 setTilte 정해주는 코드...
    // 어려움은 selectedDates 가 배열인데 첫번재 선택한것은 배열[0] 에 들어가고 두번째 선택한건 배열[1]에 들어가는 상황.
    //첫번째 선택한 날짜보다 두번째 날짜보다 작으면 selectedDates[0] 의 날짜를 삭제시키고 selectedDates[1]의 날짜가 selectedDates[0]이 되면서 날짜가 하루 전껄로 되는 오류가 나타남... 그래서 함수를 2개 만들어서 진행.
    // oenPickSendString selectedDates를 쓰지않고 '8월12일 (화)체크인검색'의 스트링을 리턴시킴;
    
    //가 지금 선택한 것의 뒤꺼를 클릭하면 디셀렉트 시키면서 날짜가 하루전껄 가르켜서 함수를 두개만들어서 진행해야했음;
    // 말로
    func sendString(input:Date,num:Int) -> String {
        let selectDateComponets = defaultCal.dateComponents([.month,.day], from: input)
        let month = selectDateComponets.month!
        let date = selectDateComponets.day!
        let dayInt = defaultCal.dateComponents([.weekday], from: calendar.selectedDates[num]).weekday!
        
        return "\(month)"+"월 "+"\(date)"+"일 "+"("+day(of: dayInt)+")"
    }
    func oenPickSendString(input:Date) -> String {
        let selectDateComponets = defaultCal.dateComponents([.month,.day], from: input)
        let month = selectDateComponets.month!
        let date = selectDateComponets.day!
        let dayInt = defaultCal.dateComponents([.weekday], from: input).weekday!
        
        return "\(month)"+"월 "+"\(date)"+"일 "+"("+day(of: dayInt)+")"
    }
    
}



// MARK:- FSCalendarDataSource

extension CalendarViewController :FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        return self.gregorian.isDateInToday(date) ? "오늘" : nil
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        let current = Date()
        return self.formatter.date(from: "\(current)") ?? date
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        
        //100일간만 예약 가능.
        let day100 = TimeInterval(60*60*24*100)
        let after100 = Date(timeIntervalSinceNow: day100)
        
        return self.formatter.date(from: "\(after100)") ?? after100
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint?.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
    
    
}

// MARK:- FSCalendarDelegate

extension CalendarViewController :FSCalendarDelegate {
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("change page to \(self.formatter.string(from: calendar.currentPage))")
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
      
        return true
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("calendar did select date \(self.formatter.string(from: date))")
        removeButton.isEnabled = true
        bottomCheckInSearchButton.isEnabled = true
        bottomCheckInSearchButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)


        bottomCheckInSearchButton.setTitle(
            oenPickSendString(input: date)+"체크인 검색", for: .normal)

        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
        
        //요일 구하기.
        
        
        
        //// 첫번째 라스트 선택시..
        if calendar.selectedDates.count > 2{
            for i in (0 ..< calendar.selectedDates.count - 1).reversed(){
                calendar.deselect(calendar.selectedDates[i])
            }
        }
        if calendar.selectedDates.count == 1 {
        }
        var startTemp: Date!
        var count = 1
        if calendar.selectedDates.count == 2{
            if calendar.selectedDates[0] < calendar.selectedDates[1]{
                startTemp = calendar.selectedDates[0]
                while startTemp < calendar.selectedDates[1]-86400{
                    startTemp += 86400
                    calendar.select(startTemp)
                    count += 1
                }
                
                bottomCheckInSearchButton.setTitle(sendString(input: calendar.selectedDates[0], num: 0)+"~"+sendString(input: calendar.selectedDates[1], num: 1)+"▪︎"+"\(count)박" , for: .normal)
                startTemp = nil
            } else {
              // 디셀렉트 되면서 뭔가 셀렉트된 날짜가 하루 앞서게 됨? 그래서 86400 초 더함..
                calendar.deselect(calendar.selectedDates[0])
                print(calendar.selectedDates[0]+86400,12313123213)
                
            }
        }
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //선택날짜 한번 더 누를 때
        print("didDeselect")
        for _ in 0 ..< calendar.selectedDates.count {
            calendar.deselect(calendar.selectedDates[0])
        }
        calendar.select(date)
        bottomCheckInSearchButton.setTitle(
            sendString(input: date,num: 0)+"체크인 검색", for: .normal)
    }
    
 
    
    
}


//아직 문제: 캘린더 들어갔다가 다시 나오면 셀렉티드 됬던 날짜들 그대로 있어야 하는데 리셋됨;
// 캘린더 레이블인가? 버튼인가..
//
