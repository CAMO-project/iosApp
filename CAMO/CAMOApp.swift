//
//  CAMOApp.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/07.
//

import SwiftUI
import Foundation

//var loginDTO : LoginDTO = LoginDTO(email: "", password: "")
var user: User = User()
var cafe: Cafe = Cafe()

let host: String = "https://d51a-211-119-150-213.jp.ngrok.io"

@main
struct CAMOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
