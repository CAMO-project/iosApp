//
//  CafeController.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/20.
//

import Foundation
import Alamofire


//"cafeId": "1000000001",
//"userId": 1,
//"cafeName": "베이그",
//"cafeAddress": "행복시 해피동 행복한로 1",
//"cafePhone": "070-6757-4822",
//"cafeIntroduce": "@chae_ryeon 히히",
//"cafeReward": "전 메뉴",
//"stampsNumber": 10


//func cafeListup(cafeDTO : CafeDTO) {
//
//}


// 카페 등록
func cafeRegister(cafe: Cafe) {
    let url = host + "/cafe/register"
    
    
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
        let encodedData = try encoder.encode(cafe)
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


func cafeUpdate(cafeUp : Cafe) {
    let url = host + "/cafe/update/" + String(user.userId)
    
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
        let encodedData = try encoder.encode(cafeUp)
        // Request Body에 json 추가
        request.httpBody = encodedData
        
    } catch {
        print("error11111")
    }
    
    AF.request(request).responseDecodable(of:Cafe.self) { response in
        switch response.result {
        case .success:
            print("호출 성공")
            
            cafe = response.value ?? cafe
            print(user)
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
}


func getCafe() {
    let url = host + "/cafe/get/" + String(user.userId)
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "GET"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).responseDecodable(of:Cafe.self) { response in
        switch response.result {
        case .success:
            print("호출 성공")
            
            cafe = response.value ?? cafe
            print(cafe)
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
    
    
}
