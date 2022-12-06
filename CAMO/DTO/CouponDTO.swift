//
//  CouponDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/06.
//

import Foundation

struct CouponDTO : Codable, Identifiable {
    
    var cafeId: String
    var cafeName: String
    var cafeAddress: String
    var cafeReward: String
    var cafeRewardstamp: Int
    var couponUserstamp: Int
    
    let id = UUID()
}


/*
 {
         "cafeId": "1000000002",
         "cafeName": "포롱",
         "cafeAddress": "행복시 해피동 행복한로 2",
         "cafeReward": "아메리카노",
         "cafeRewardstamp": 10,
         "couponUserstamp": 6
     }
 */

