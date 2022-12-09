//
//  MenuController.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation
import Alamofire

class MenuController: ObservableObject {
    
    @Published var menuList = [MenuListDTO]()
    @Published var menuNew = [MenuListDTO]()
    
    func getMenuList(cafeId: String) {
        
        let url = host + "/menu/" + cafeId
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: [MenuListDTO].self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 menuList")
                self.menuList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 menuList")
            }
        }
        
    }
    
    func getNewMenu(cafeId: String) {
        
        let url = host + "/menu/new/" + cafeId
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: [MenuListDTO].self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 menuList")
                self.menuNew = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 menuList")
            }
        }
        
    }
    
    func menuRegister(menuRegi: Menu) {
        
        let url = host + "/menu"
        
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
            let encodedData = try encoder.encode(menuRegi)
            // Request Body에 json 추가
            request.httpBody = encodedData
        } catch {
            print("error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("메뉴등록 성공")
            case .failure(_):
                print("메뉴등록 실패")
            }
        }
        
    }
}
