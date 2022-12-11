//
//  CafeController.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/20.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

class CafeController: ObservableObject {
    
    // myCafe
    @Published var myCafe = Cafe()
    
    @Published var cafeInfo = CafeInfoDTO()
    
    @Published var cafeList = [CafeListDTO]()
    
    @Published var userData = User()
    
    // 카페 폐쇄
    @Published var returnIsDeleted = false
    
    func getCafeInfo(cafeId: String) {
//        /cafe/{cafeId}?userId={userId}
        let url = host + "/cafe/" + cafeId + "?userId=" + String(user.userId)
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: CafeInfoDTO.self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 cafeInfo")
                self.cafeInfo = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 cafeInfo")
            }
        }
    }
    
    func getCafeList() {
        
        let url = host + "/cafe/list"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: [CafeListDTO].self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 getCafeList")
                self.cafeList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getCafeList")
            }
        }
        
    }
    
    
    func searchCafeList(_ search: String) {
        let url = host + "/cafe/name/" + search
        print(search)
        
        // URLRequest 객체 생성 (url 전달)
//        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
//        request.httpMethod = "GET"
        // 헤더 정보 설정
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request((host + "/cafe/name/" + search).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "").responseDecodable(of: [CafeListDTO].self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 getCafeList")
                self.cafeList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getCafeList")
            }
        }
    }
    
    func getCafe() {
        
        let url = host + "/cafe/user/" + String(user.userId)
        print("getcafe-> userId: \(user.userId)")
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of:Cafe.self) { response in
            switch response.result {
            case .success(let value):
                print("호출 성공 getMyCafe")
                self.myCafe = value
                cafe = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getMyCafe")
            }
        }
        
    }
    
    // 카페 등록
    func cafeRegister(cafeRegi: Cafe) {
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
            let encodedData = try encoder.encode(cafeRegi)
            // Request Body에 json 추가
            request.httpBody = encodedData
        } catch {
            print("error")
        }
        
        AF.request(request).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let value):
                print("호출 성공 cafeRegister")
                self.userData = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 cafeRegister")
            }
        }
        
    }
    
    // 카페 수정
    func cafeUpdate(editCafeDTO : EditCafeDTO) {
        let url = host + "/cafe/" + String(cafe.cafeId)
        print("cafeUpdate func -> cafe: \(cafe)")
        
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
            case .success(let value):
                print("호출 성공 cafeUpdate")
                self.myCafe = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 cafeUpdate")
            }
        }
    }
    
    // login
    func deleteCafe(cafeDel: CafeDeleteDTO) {
        let url = host + "/cafe"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "DELETE"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // json 인코더 생성
        let encoder = JSONEncoder()
        
        // json 출력 시 예쁘게 출력
        encoder.outputFormatting = .prettyPrinted
        
        do {
            // json 객체로 변환
            let encodedData = try encoder.encode(cafeDel)
            // Request Body에 json 추가
            request.httpBody = encodedData
            
        } catch {
            print("error")
        }
        
        AF.request(request).responseDecodable(of:User.self) { response in
            switch response.result {
            case .success(let value):
                print("카페 폐쇄 성공")
                self.userData = value
                user = value
                self.returnIsDeleted = true
                
            case .failure(_):
                print(response.result)
                print("카페 폐쇄 실패")
                self.returnIsDeleted = false
            }
        }
    }
    
}
