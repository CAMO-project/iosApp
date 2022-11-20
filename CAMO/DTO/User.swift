//
//  User.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/19.
//

import Foundation

// MARK: - User
struct User: Codable {
    var userId: Int
    var email, name, password, phone: String
    var role: Int

    init(){
        userId = 0
        email = ""
        name = ""
        password = ""
        phone = ""
        role = 0
    }
    
    // 회원가입 생성자
    init(email: String, name: String, password: String, phone: String) {
        userId = 0
        self.email = email
        self.name = name
        self.password = password
        self.phone = phone
        self.role = 0
    }
}

struct EditUserDTO : Codable {
    
    var name, password, phone: String
    
    init(name: String, password: String, phone: String) {
        self.name = name
        self.password = password
        self.phone = phone
    }
    
}
