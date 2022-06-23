//
//  SignUpViewModel.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation
import Combine
import Alamofire
import UIKit

class SignUpViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    func signUp(images: [UIImage], nickname: String, completion: @escaping (Bool) -> Void) {
        AF.upload(multipartFormData: { (multipart) in
            for image in images {
                let imageData = image.jpegData(compressionQuality: 0.8)!
                multipart.append(imageData, withName: "files", fileName: "image", mimeType: "image/jpeg")
            }
            multipart.append(nickname.data(using: .utf8)!, withName: "nickname")
        }, to: UserAPI.signUp.path())
            .publishData()
            .compactMap { $0.response }
            .sink(receiveCompletion: { completion in
                print("데이터 불러오기 완료")
            }, receiveValue: { value in
                switch value.statusCode {
                case 201:
                    completion(true)
                    print("성공")
                default:
                    completion(false)
                    print(value)
                }
            }).store(in: &subscription)
        
    }
}
