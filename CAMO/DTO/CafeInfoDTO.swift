//
//  CafeInfoDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/08.
//

import Foundation

struct CafeInfoDTO: Codable {
    
    var cafeId: String // 사업자번호
//    var userId: Int // 카페 사장 회원번호
    var cafeName: String
    var cafeAddress: String
    var cafePhone: String
    var cafeIntroduce: String
    var cafeReward: String
    var cafeRewardstamp: Int // 카페 스탬프
    var couponUserstamp: Int // 사용자가 모은 스탬프
    var avgRating: Float
//    var cafeImage: String
    
    init() {
        cafeId = ""
//        userId = 0
        cafeName = ""
        cafeAddress = ""
        cafePhone = ""
        cafeIntroduce = ""
        cafeReward = ""
        cafeRewardstamp = 0
        couponUserstamp = 0
        avgRating = 0
//        cafeImage = ""
    }
}
