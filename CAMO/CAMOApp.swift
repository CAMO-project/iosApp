//
//  CAMOApp.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/07.
//

import SwiftUI
import Foundation

//var loginDTO : LoginDTO = LoginDTO(email: "", password: "")
var user: User = User() // 내 정보
var cafe: Cafe = Cafe()  // 내 카페 정보

let host: String = "http://180.69.79.224:8888"

@main
struct CAMOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
