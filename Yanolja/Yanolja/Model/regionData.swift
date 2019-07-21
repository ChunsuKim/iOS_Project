//
//  regionData.swift
//  Yanolja
//
//  Created by brian은석 on 19/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation


struct location {
    let city :String
    let sub :[String]
}


let locations = [
    location(city: "서울",
             sub:
    ["강남/역삼/삼성/논현","서초/신사/방배","잠실/신천(잠실새내)","영등포/여의도","신림/서울대/사당/동작","천호/길동/둔춘","화곡/까치산/양천/목동","구로/금천/오류/신도림","신촌/홍대/합정","연신내/불광/응암","종로/대학로","성신여대/성북/월곡","이태원/용산/서울역/명동/회현","동대문/동묘/신당/충무로/약수","회기/고려대/청량리/신설동","장안동/답십리","건대/군자/구의","왕십리/성수/금호","수유/미아","상봉/중랑/면목","태릉/노원/도봉/창동"]),
    location(city: "경기",
             sub:
        ["수원 인계","수원 권선/영동","수원역/구운/장안/세류","안양/평촌/인덕원/과천","성남/분당/위례","용인","동탄/오산/병점","하남/광주/여주/이천","안산","군포/의왕/금정/산본","시흥/광명","평택/송탄/화성/안성","부천","일산/고양","파주","김포","의정부","구리","남양주","포천","양주/동두천/연천","양평","가평/청평","제부도/대부도"]),
    location(city: "인천", sub: ["부평","구월","서구","계양","주안","송도/연수","인천공항/을왕리","중구(월미도/차이나타운/신포/동인천","강화/옹진","동암/간석","남동구(소래/만수)","용현/숭의/도화/동구"]),
    location(city: "강원", sub: ["춘천/강촌","원주","경포대/사천/주문진","강릉역/교동/옥계/정동진","영월/정선","속초/양양/고성","동해/삼척/태백","평창","홍천/횡성","화천/철원/인제/양구"]),
    location(city: "제주", sub: ["제주시","서귀포시","하귀/애월/한림/협재"]),
    location(city: "대전", sub: ["유성구","중구(은행/대흥/선화)","동구(용전/복합터미널)","서구(둔산/용문)","대덕구(중리/신탄진)"]),
    location(city: "충북", sub: ["청주 흥덕구 / 서원구(청주 터미널)","청주 상당구/청원구 (청주국제공항)","충주/수안보","제천/진천/음성/단양","보은/옥천/괴산/증평/영동"]),
    location(city: "충남/세종", sub: ["천안 서북구","천안 동남구","아산","공주/동학사/세종","계룡/금산/논산/청양","예산/홍성","태안/안면도/서산","당진","보령/대천","서천/부여"]),
    location(city: "부산", sub: ["해운대/센텀시티/재송","송정/기장/정관","서면/양정/초읍/부산시민공원","남포동/중앙동/태종대/송도/영도","부산역/범일동/부산진역","광안리/수영","경성대/대연/용호동/문현","연산/토곡","동래/사직/온천장/부산대/구서","사상(경진철)/엄궁/학장","덕천/화명/만덕/구포(구포역/KTX역)","하단/명지/과정/다대포/신호/지사/김해공항"]),
    location(city: "울산", sub: ["남구/중구(삼산/성남/무거/신정)","동구/북구/울주군(일산/진장/진하/KTX역/영남알프스)"]),
    location(city: "경남", sub: ["창원 상남동/용호동/중앙동/창원시청","창원 명서동/봉곡동/팔용동/북면온천/창원종합버스터미널","마산/진해","김해/장유","양산/밀양","진주","거제/통영/고성","사천/남해","하동/산청/함양","거창/함안/창녕/합천/의령"]),
    location(city: "대구", sub: ["동성로/서문시장/대구역/경북대/엑스코/칠곡지구/태전동","동대구역/신천동/혁신도시/동촌유원지/대구공항/팔공산","수성못/항금동/들안길/두산동/범어","북부정류장/평리동/원대동/대명동/봉덕동/안지랑","두류공원/본리/죽전/광장코아/서부정류장","성서/성서공단/계명대/상인동/달성군"]),
    location(city: "경북", sub: ["포항/남구","포항/북구","경주","구미","경산","안동","영천/청도","김천/칠곡/성주","문경/상주/영주/예천/군위/의성/봉화","울진/영덕/청송","울릉도"]),
    location(city: "광주", sub: ["상무지구/금호지구/유스퀘어/서구","첨단지구/하남지구/송정역/광산구","충장로/대인시장/국립아시아문화","광주역/기아챔피언필드/북구"]),
    location(city: "전남", sub: ["여수","순천","광양","목포/무안/영암/신안","나주/함평/영광/장성","담양/곡성/화순/구례","해남/완도/진도/강진/장흥/보성/고흥"]),
    location(city: "전주/전북", sub: ["전주/완주","군산","익산","남원/임실/순창/무주/진안/장수","정읍/부안/김제/고창"])
]