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
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    private let date = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        
        topUI()
        calenderFeat()
    }
    private func topUI() {
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
        calendar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
        
        
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
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
        
        
        //// 첫번째 라스트 선택시..
        if calendar.selectedDates.count > 2{
            for i in (0 ..< calendar.selectedDates.count - 1).reversed(){
                calendar.deselect(calendar.selectedDates[i])
            }
        }
        var startTemp: Date!
        if calendar.selectedDates.count == 2{
            if calendar.selectedDates[0] < calendar.selectedDates[1]{
                startTemp = calendar.selectedDates[0]
                while startTemp < calendar.selectedDates[1]-86400{
                    startTemp += 86400
                    calendar.select(startTemp)
                }
                startTemp = nil
            }
            else{
                startTemp = calendar.selectedDates[1]
                while startTemp < calendar.selectedDates[0] - 86400{
                    startTemp += 86400
                    calendar.select(startTemp)
                }
            }
        }
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //선택날짜 한번 더 누를 때
        for _ in 0 ..< calendar.selectedDates.count {
            calendar.deselect(calendar.selectedDates[0])
        }
        calendar.select(date)
    }
    
}
