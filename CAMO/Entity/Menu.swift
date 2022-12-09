//
//  Menu.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/10.
//

import Foundation

struct Menu: Codable {
    
    var menuId: Int
    var menuName: String
    var menuPrice: Int
    var cafeId : String

    init() {
        menuId = 0
        menuName = ""
        menuPrice = 0
        cafeId = cafe.cafeId
    }
    
    // 메뉴 등록
    init(menuId: Int, menuName: String, menuPrice: Int, cafeId: String) {
        self.menuId = menuId
        self.menuName = menuName
        self.menuPrice = menuPrice
        self.cafeId = cafeId
    }
    
}

/*
 {
     “menuId” : int,
     “menuName” : “String”,
     “menuPrice” : int,
     “cafeId” : “String”
 }
 */
