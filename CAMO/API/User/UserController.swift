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


// postman으로 실행했을때도 안되던데 서버 코드가 잘못된듯
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
            print("호출 성공 editUserInfo")
            
            user = response.value ?? user
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패 editUserInfo")
        }
    }
}

func getUser() -> User {
    let url = host + "/user/" + String(user.userId)
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "GET"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).responseDecodable(of:User.self) { response in
        print("request api \(user)")
        switch response.result {
        case .success:
            print("호출 성공 getUser")
            
            user = response.value ?? user
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패 getUser")
        }
    }
    print("user 반환")
    return user
    
}


// postman으로 확인했을때 delete 잘 실행됐는데 로그에는 호출 실패로 뜸
// 리퀘에 user 반환하는거 어떻게 없애
func deleteUser() {
    let url = host + "/user/" + String(user.userId)
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "DELETE"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).response { response in
        print("request api \(user)")
        switch response.result {
        case .success:
            print("호출 성공 deleteUser")
            user = User()
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패 deleteUser")
        }
    }
}
