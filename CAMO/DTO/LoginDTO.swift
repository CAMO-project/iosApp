//
//  LoginDTO.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/19.
//

import Foundation


struct LoginDTO : Codable {
    
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
