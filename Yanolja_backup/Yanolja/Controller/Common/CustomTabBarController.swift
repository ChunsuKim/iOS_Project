//
//  CustomTabBarController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        todayAndTomorrowDate()
        
        viewControllers = [
            createNaviController(viewController: HomeViewController(), title: "홈", imageName: "homed"),
            createNaviController(viewController: RegionViewController(), title: "지역", imageName: "regiond"),
            createNaviController(viewController: MyLocationViewController(), title: "내주변", imageName: "mylocad"),
            createNaviController(viewController: UserViewController(), title: "MY 야놀자", imageName: "userd")
        ]
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
        singleTon.todayString = todayString+"(\(day(of: todayWeek)))"
        singleTon.tomorrowString = tomorrowString+"(\(day(of: tomorrowWeek)))"
        singleTon.saveDate.append(today)
        singleTon.saveDate.append(today+86400)
    print("singleTon.saveDate :",singleTon.saveDate)
        
    }
    
    
    private func createNaviController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let naviController = UINavigationController(rootViewController: viewController)
        naviController.tabBarItem.title = title
        naviController.tabBarItem.image = UIImage(named: imageName)
//        naviController.navigationBar.prefersLargeTitles = true
        tabBar.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return naviController
    }
}
