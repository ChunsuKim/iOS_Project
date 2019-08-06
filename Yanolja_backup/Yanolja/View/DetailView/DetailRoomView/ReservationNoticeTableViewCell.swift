//
//  reservationNoticeTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ReservationNoticeTableViewCell: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "예약공지"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let cont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = """
        ﹒객실요금은 2인 입실 기준이며, 파티룸 등 특수객실의 경우, 직접 입실 인원 확인이 필요합니다.
        ﹒미성년자의 입실 가능여부는 직접 제휴점에 확인 후 예약 진행하시기 바랍니다.
        ﹒미성년자 혼숙예약으로 인해 발생하는 입실 거부에 대해서는 취소/환불이 불가합니다.
        ﹒제휴점 사정에 의한 취소 발생 시 100% 환불 처리됩니다.
        ﹒제휴점 사정으로 객실 정보가 수시로 변경될 수 있습니다. 이로 인한 불이익은 당사가 책임지지 않습니다.
        ﹒사진과 실제 객실은 일부 차이가 있을수있습니다.
        """
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(title)
        contentView.addSubview(cont)
        
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.bottomAnchor.constraint(equalTo: cont.topAnchor, constant: -20),
            cont.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            cont.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            cont.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            cont.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
}
