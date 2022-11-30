//
//  UserController.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/19.
//

import Foundation
import Alamofire

//enum NetworkResult<T> {
//    case pathErr
//}

func login(loginDTO: LoginDTO) -> Bool {
    
    var isLogin = true
    
    let url = host + "/user/" + loginDTO.email + "?password=" + loginDTO.password
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "GET"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    // json 인코더 생성
//    let encoder = JSONEncoder()
//
//    // json 출력 시 예쁘게 출력
//    encoder.outputFormatting = .prettyPrinted
//
//    do {
//        // json 객체로 변환
//        let encodedData = try encoder.encode(loginDTO)
//        // Request Body에 json 추가
//        request.httpBody = encodedData
//    } catch {
//        print("error11111")
//    }
    
    AF.request(request).responseDecodable(of:User.self) { response in
        switch response.result {
        case .success:
            print("호출 성공")
            
            user = response.value ?? user
            print(user)
            isLogin = true
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
            isLogin = false
            print(isLogin)
        }
    }
    
    return isLogin
}

func join(userJoin: User) {
    
    let url = host + "/user/signup"
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "POST"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // json 인코더 생성
    let encoder = JSONEncoder()
    
    // json 출력 시 예쁘게 출력
    encoder.outputFormatting = .prettyPrinted
    
    do {
        // json 객체로 변환
        let encodedData = try encoder.encode(userJoin)
        // Request Body에 json 추가
        request.httpBody = encodedData
        
//        if let jsonStr = try String(data: encodedData, encoding: .utf8) {
//            print(jsonStr)
////            request.httpBody = jsonStr
//        }
    } catch {
        print("error11111")
    }
    
    AF.request(request).responseString { (response) in
        switch response.result {
        case .success:
            print("POST 성공")
        case .failure(_):
            print("error")
        }
    }
    
}

func editUserInfo(editUserDTO: EditUserDTO) {
    
    let url = host + "/user/" + String(user.userId)
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "PUT"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // json 인코더 생성
    let encoder = JSONEncoder()
    
    // json 출력 시 예쁘게 출력
    encoder.outputFormatting = .prettyPrinted
    
    do {
        // json 객체로 변환
        let encodedData = try encoder.encode(editUserDTO)
        // Request Body에 json 추가
        request.httpBody = encodedData
        
    } catch {
        print("error11111")
    }
    
    AF.request(request).responseDecodable(of:User.self) { response in
        switch response.result {
        case .success:
            print("호출 성공")
            
            user = response.value ?? user
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
}

func getUser() {
    let url = host + "/user/" + String(user.userId)
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "GET"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).responseDecodable(of:User.self) { response in
        switch response.result {
        case .success:
            print("호출 성공")
            
            user = response.value ?? user
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
    
}

func getUserWithReturn() -> User {
    let url = host + "/user/id/" + String(user.userId)
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "GET"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).responseDecodable(of:User.self) { response in
        switch response.result {
        case .success:
            print("호출 성공")
            
            user = response.value ?? user
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
    
    return user
    
}
