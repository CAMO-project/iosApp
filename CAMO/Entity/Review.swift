//
//  Review.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/03.
//

import Foundation

struct Review: Codable {
    var reviewId: Int
    var userEmail: String
    var reviewRating: Int
    var reviewContent: String
    var reviewDate: String
    var cafeId: String
    var userId: Int
}
