//
//  ImageController.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/08.
//

import Foundation
import Alamofire

class ImageController : ObservableObject {
    
    func uploadFile(cafeId : String, imageData : Data) {
        let url = host + "/file/upload/\(cafeId)"
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "file")
        }, to: url, method: .post).response { response in
            switch response.result {
            case .success(let value):
                print("호출 성공 uploadFile")
                print(value)
                
            case .failure(_):
                print("호출 실패 uploadFile")
                print(response.result)
            }
        }
                  
    }
    
}
