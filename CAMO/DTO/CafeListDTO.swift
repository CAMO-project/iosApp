//
//  CafeListDto.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/30.
//

import Foundation

struct CafeListDTO : Codable, Identifiable {
    
    
    var cafeId : String
    var cafeName : String
    var cafeAddress : String
    var avgRating : Float
    
    let id = UUID()
    
//    init(cafeId : String, cafeName : String, cafeAddress : String, avgRating : Float){
//        self.cafeId = cafeId
//        self.cafeName = cafeName
//        self.cafeAddress = cafeAddress
//        self.avgRating = avgRating
//    }
    
}
