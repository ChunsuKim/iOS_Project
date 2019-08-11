//
//  LaunchViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 07/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    // MARK: - Properties
    private var timer = Timer()
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let activityIndicatorView = UIActivityIndicatorView()
    private let statusLabel = UILabel()
    private let copyRightLabel = UILabel()
    private let airplaneImage = UIImageView()
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        airplaneImage.image = #imageLiteral(resourceName: "airplane")
        view.addSubview(airplaneImage)
        airplaneImage.frame = CGRect(x: -150, y: 150, width: 150, height: 150)
        
        _ = airplaneImage.center
        UIView.animateKeyframes(
            withDuration: 4,
            delay: 0.0,
            animations: {
                // 로그인 버튼을 0.4초동안 우측 아래로 이동
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                    self.airplaneImage.center.x = self.view.center.x
                    self.airplaneImage.center.y = self.view.center.y
                })
        }, completion: { _ in
            self.activityIndicatorView.stopAnimating()
        })
    }
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        todayAndTomorrowDate()
        
        configureUserInterface()
        configureConstraints()
        operateActivitiIndicator()
        
        // 4초 뒤에 뷰 컨트롤러를 띄우는거
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            let appDelegate =  UIApplication.shared.delegate as! AppDelegate
            let tapbar = CustomTabBarController()
            
            appDelegate.window?.rootViewController = tapbar
        }
      
    }
    
    // MARK: - 여기는 오늘과 내일의 날짜를 싱글톤에 저장시키는 함수입니다!
    
    private func todayAndTomorrowDate() {
        let defaultCal = Calendar(identifier: .gregorian)
        let today = Date() //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일"
        
        
        var todayString = dateFormatter.string(from: today)
        var tomorrowString = dateFormatter.string(from: today+86400)
        
        let todayWeek = defaultCal.component(.weekday, from: today)
        let tomorrowWeek = defaultCal.component(.weekday, from: today+86400)
        
        singleTon.todayString = todayString+"(\(day(of: todayWeek)))"
        singleTon.tomorrowString = tomorrowString+"(\(day(of: tomorrowWeek)))"
        
        singleTon.checkInDateString = todayString+"(\(day(of: todayWeek)))"
        singleTon.checkOutDateString = tomorrowString+"(\(day(of: tomorrowWeek)))"
        
        singleTon.selectDateButtonCurrentTitle = singleTon.todayString+"~"+singleTon.tomorrowString+",1박"
        singleTon.selectNumberOfPeopleButtonCurrentTitle = "성인 \(singleTon.adultCount), 아동 \(singleTon.childCount)"
        
        singleTon.saveDate.append(today)
        singleTon.saveDate.append(today+86400)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        
        singleTon.checkInDate = formatter.string(from: today)
        singleTon.checkOutDate = formatter.string(from: today+86400)
        print("singleTon.checkInDate :", singleTon.checkInDate)
    }
    
    
    
    
    
    // MARK: - Configuration
    private func configureUserInterface() {
        backgroundImageView.image = #imageLiteral(resourceName: "Launch")
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.text = ""
        titleLabel.textColor = #colorLiteral(red: 0.8543364406, green: 0, blue: 0.3139223754, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        activityIndicatorView.color = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        statusLabel.text = "데이터를 불러오는 중입니다!"
        statusLabel.textColor = .white
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        copyRightLabel.text = " Copyright (c) 2019. iOS Team. All rights reserved."
        copyRightLabel.textColor = #colorLiteral(red: 0.009850479662, green: 0.29078269, blue: 0.5762767196, alpha: 1)
        copyRightLabel.textAlignment = .center
        copyRightLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(titleLabel)
        backgroundImageView.addSubview(activityIndicatorView)
        backgroundImageView.addSubview(statusLabel)
        backgroundImageView.addSubview(copyRightLabel)
    }
    
    private func configureConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 200).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 10).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        copyRightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyRightLabel.leadingAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        copyRightLabel.trailingAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        copyRightLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        copyRightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let str = "야!, 너두 놀 수 있어!"
        let privacyAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: str)
        privacyAgreeAttributedString.setColorForText(textForAttribute: "야!", withColor: #colorLiteral(red: 0.8543364406, green: 0, blue: 0.3139223754, alpha: 1))
        privacyAgreeAttributedString.setFontForText(textForAttribute: "야!", withFont: UIFont.systemFont(ofSize: 60, weight: .light))
        privacyAgreeAttributedString.setColorForText(textForAttribute: ", 너두 놀 수 있어!", withColor: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
        privacyAgreeAttributedString.setFontForText(textForAttribute: ", 너두 놀 수 있어!", withFont: UIFont.systemFont(ofSize: 28, weight: .semibold))
        titleLabel.attributedText = privacyAgreeAttributedString
        
//        let str = "야!, 너두 놀 수 있어!"
//        for x in str {
//            titleLabel.text! += "\(x)"
//            RunLoop.current.run(until: Date()+0.2)
//        }
    }
    
    
    private func operateActivitiIndicator() {
        
        activityIndicatorView.startAnimating()
        
    }
    
    
    // MARK: - Action Methods
    @objc private func presentMainView() {
        timer.invalidate()
        let viewController = HomeViewController()
        
//        present(viewController, animated: true)
        present(viewController, animated: true) {
            self.dismiss(animated: true, completion: nil)
        }
        activityIndicatorView.stopAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
}
