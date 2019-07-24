//
//  UserViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    private let userViewTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUserViewTableView()
    }
    
    
    private func configureUserViewTableView() {
     
        userViewTableView.estimatedRowHeight = 50
        userViewTableView.rowHeight = UITableView.automaticDimension
        userViewTableView.dataSource = self
        userViewTableView.delegate = self
        userViewTableView.register(UserViewLoginTableViewCell.self, forCellReuseIdentifier: UserViewLoginTableViewCell.identifier)
        
        view.addSubview(userViewTableView)
        
        userViewTableView.translatesAutoresizingMaskIntoConstraints = false
        userViewTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        userViewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userViewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        userViewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = userViewTableView.dequeueReusableCell(withIdentifier: UserViewLoginTableViewCell.identifier, for: indexPath) as! UserViewLoginTableViewCell
        
        switch indexPath.row {
        case 0:
            
            cell.configureInputValue(text: "로그인 및 회원가입", textColor: #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1))
            
        case 1:
            
            cell.configureInputValue(text: "비회원 국내숙소 예약조회", textColor: .black)
            
        case 2:
            
            cell.configureInputValue(text: "비회원 해외숙소 예약조회", textColor: .black)
            
        case 3:
            
            cell.configureInputValue(text: "비회원 레저/티켓 구매내역", textColor: .black)
            
        default:
            cell.configureInputValue(text: "정진배", textColor: .black)
        }
        
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loginViewController = LoginViewController()
        
        switch indexPath.row {
        case 0:
            present(loginViewController, animated: true, completion: nil)
            
        default:
            break
        }
    }
}
