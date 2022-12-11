//
//  ReviewListDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/03.
//

import Foundation

struct ReviewListDTO : Codable, Identifiable {

    var reviewId: Int
    var userEmail: String
    var reviewRating: Int
    var reviewContent: String
    var reviewDate: String
    var cafeId: String
    
    let id = UUID()
}

/*{
        "reviewId": 5,
        "userEmail": "q17@gmail.com",
        "reviewRating": 2,
        "reviewContent": "음료가 좋습니다. 가게 분위기도 좋구요. 추천 박아요",
        "reviewDate": "2022-11-27",
        "userId": 17,
        "cafeId": "1000000001"
    }
*/
