//
//  CafeController.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/20.
//

import Foundation
import Alamofire
import SwiftyJSON


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

// 카페 수정
func cafeUpdate(editCafeDTO : EditCafeDTO) {
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
        let encodedData = try encoder.encode(editCafeDTO)
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
            print(cafe)
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
}


func getCafe() {
    let url = host + "/cafe/" + String(user.userId)
    
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

func getCafeWithReturn() -> Cafe {
    
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
    
    return cafe
    
}

func getCafeList() -> Array<CafeListDTO> {
//    var cafeList : [CafeListDTO]
//    var cafeList : Array<CafeListDTO> = []

    var cafeList = Array<CafeListDTO>()
    
    
    let url = host + "/cafe/list"
    
    // URLRequest 객체 생성 (url 전달)
    var request = URLRequest(url: URL(string: url)!)
    // 메소드 지정
    request.httpMethod = "GET"
    // 헤더 정보 설정
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).response() { response in
        switch response.result {
        case .success:
            print("호출 성공")
            let jsonArray = JSON(response.value)
//            print("json : \(jsonArray)")
//            var i : Int = 0
            for (index, json) : (String, JSON) in jsonArray {
                guard let cafeId = json["cafeId"].string,
                      let cafeName = json["cafeName"].string,
                      let cafeAddress = json["cafeAddress"].string,
                      let avgRating = json["avgRating"].float
                        
                else {
                    continue
                }
//                print("\(index) - id: \(cafeId), name: \(cafeName)")
                cafeList.append(CafeListDTO(cafeId:cafeId, cafeName: cafeName, cafeAddress: cafeAddress, avgRating: avgRating))
            }
            
//            print(cafeList.count)
//            print(cafeList[0])
            
        case .failure(_):
            print(response.result)
            print("호출 실패")
        }
    }
//    print(cafeList[0])
    print("반환")
    return cafeList
    
}
