//
//  CafeDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/20.
//

import Foundation

struct Cafe : Codable {
    
    var cafeId: String // 사업자번호
    var userId: Int  // 회원번호
    var cafeName: String
    var cafeAddress: String
    var cafePhone: String
    var cafeIntroduce: String
    var cafeReward: String
    var stampsNumber: Int
    
    init() {
        cafeId = ""
        userId = user.userId
        cafeName = ""
        cafeAddress = ""
        cafePhone = ""
        cafeIntroduce = ""
        cafeReward = ""
        stampsNumber = 0
    }
    
    // 카페 생성자
    init(cafeId: String, cafeName: String, cafeAddress: String, cafePhone: String) {
        self.cafeId = cafeId
        userId = user.userId
        self.cafeName = cafeName
        self.cafeAddress = cafeAddress
        self.cafePhone = cafePhone
        cafeIntroduce = ""
        cafeReward = ""
        stampsNumber = 0
    }
    
}

struct EditCafeDTO : Codable {
    
    var cafeName, cafeAddress, cafePhone, cafeIntroduce, cafeReward : String
    var stampsNumber: Int
    
    init(cafeName: String, cafeAddress: String, cafePhone: String, cafeIntroduce: String, cafeReward: String, stampsNumber: Int) {
        self.cafeName = cafeName
        self.cafeAddress = cafeAddress
        self.cafePhone = cafePhone
        self.cafeIntroduce = cafeIntroduce
        self.cafeReward = cafeReward
        self.stampsNumber = stampsNumber
    }
}

