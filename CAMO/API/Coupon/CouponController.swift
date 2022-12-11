//
//  CouponController.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/06.
//

import Foundation
import Alamofire


class CouponController: ObservableObject {
    
    @Published var couponList = [CouponDTO]()
    
    func getCouponList() {
        
        let url = host + "/coupon/user/" + String(user.userId)
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of: [CouponDTO].self) { response in
            print("alamofire 실행~~")

            switch response.result {
            case .success(let value):
                print("호출 성공 getCafeList")
                self.couponList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getCafeList")
            }
        }
        
    }
    
    func accumulateCoupon(accumulCouponDTO: AccumulateCouponDTO) {
        let url = host + "/coupon"
        
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
            let encodedData = try encoder.encode(accumulCouponDTO)
            // Request Body에 json 추가
            request.httpBody = encodedData
        } catch {
            print("error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("쿠폰 적립 성공")
            case .failure(_):
                print("쿠폰 적립 실패")
            }
        }
    }
    
    func useCoupon(_ email: String) {
        let url = host + "/coupon/use?cafeId=" + cafe.cafeId + "&userEmail=" + email
        
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
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("쿠폰 사용 성공")
            case .failure(_):
                print("쿠폰 사용 실패")
            }
        }
        
    }
    
    
}



