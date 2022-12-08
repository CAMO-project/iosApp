//
//  MenuListDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation

struct MenuListDTO: Codable, Identifiable {
    
    var menuId: Int
    var menuName: String
    var menuPrice: Int

    let id = UUID()
}

/*
 {
         “menuId” : int,
         “menuName” : “String”,
         “menuPrice” : int
     },
 */
