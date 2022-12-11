//
//  AccumulateCouponDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/11.
//

import Foundation

struct AccumulateCouponDTO: Codable {
    
    var stampQuantity: Int
    var userEmail: String
    var cafeId: String
    
}

/*
 {
     “stampQuantity” : int,
     “email” : String,
     “cafeId” : String
 }
 */
