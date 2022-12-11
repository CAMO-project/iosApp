//
//  MyReviewListDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/11.
//

import Foundation

struct MyReviewListDTO: Codable, Identifiable {
    
    var reviewId: Int
    var reviewRating: Int
    var reviewContent: String
    var reviewDate: String
    var cafeName: String
    
    let id = UUID()
    
}

/*
 [
     {
         “reviewId” : int,
         “reviewRating” : int,
         “reviewContent” : “String”,
         “reviewDate” : “String”,
         “cafeName” : “String”
     },
     …
 ]
 */
