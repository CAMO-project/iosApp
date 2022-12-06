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
    
    
    
    
}
