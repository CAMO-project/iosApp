//
//  ReviewController.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/03.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

class ReviewController: ObservableObject {

    @Published var reviewList = [ReviewListDTO]()
    
    func writeReview(_ review: Review){
        
        let url = host + "/review/"
        
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
            let encodedData = try encoder.encode(review)
            // Request Body에 json 추가
            request.httpBody = encodedData
            print(encodedData)
        } catch {
            print("error")
        }
        
        AF.request(request).response{ response in
            switch response.result {
            case .success:
                print("호출 성공 writeReview")
                
            case .failure(_):
                print(response.result)
                print("호출 실패 writeReview")
            }
        }
    }
    
    func getReivewList(cafeId: String) {
        
        let url = host + "/review/cafe/" + cafeId
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: [ReviewListDTO].self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 getReivewList")
                self.reviewList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getReivewList")
            }
        }
    }
}
