//
//  ImageController.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/08.
//
import SwiftUI
import Foundation
import Alamofire

//struct CafeImage: Codable {
//    var fileName: String
//    var fileDownloadUri: String
//    var fileType: String
//    var size: Int
//}

/*
 {
     “fileName” : “String”,
     “fileDownloadUri” : “String”,
     “fileType” : “String”,
     “size” : int
 }
 */

class ImageController : ObservableObject {
    
    @Published var image: UIImage?
    var data: Data?
    
    func uploadFile(cafeId : String, imageData : Data) {
        
        let url = host + "/file/upload/" + cafeId
        
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
    
    func downloadFile(cafeImage: String){
//        let url = URL(string: "http://180.69.79.224:8888/file/download/" + cafeImage)
//        
//        DispatchQueue.main.async{
//            self.data = try? Data(contentsOf: url!)
//            print("data 받아오는 중...")
//        }
//        DispatchQueue.main.async {
//            self.image = UIImage(data: self.data!)
//            print("data를 image로 변환 중")
//        }
    }
}
