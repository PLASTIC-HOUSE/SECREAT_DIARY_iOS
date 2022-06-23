//
//  SignInViewModel.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/23.
//

import Foundation
import Combine
import UIKit
import Alamofire

class SignInViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    let httpClient = HTTPClient()
    
    let header : HTTPHeaders = ["Content-Type" : "multipart/form-data"]
    
    
    func signIn(image: UIImage, completion: @escaping(Bool) -> Void) {
        let imageData = image.jpegData(compressionQuality: 0.8)!
        
        AF.upload(multipartFormData: {(multipart) in
            multipart.append(imageData, withName: "sign", fileName: "image", mimeType: "image/jpeg")
        }, to: UserAPI.postImg.path(),
                  usingThreshold: UInt64.init(), method: .post, headers: header
        ).responseData(completionHandler: { [unowned self] res in
            let data = res.data!
            let model = try? JSONDecoder().decode(LoginId.self, from: data)
            switch res.response?.statusCode {
            case 200:
                httpClient.post(
                    url: UserAPI.login.path(),
                    params: ["user_id": model?.id],
                    header: ["Content-Type": "application/json"]
                ).responseData(completionHandler: { result in
                    let tokenModel = try? JSONDecoder().decode(Token.self, from: result.data!)
                    switch result.response?.statusCode {
                    case 201:
                        completion(true)
                        token = tokenModel?.access_token ?? ""
                        print(token)
                    default:
                        completion(false)
                        print(result.response?.statusCode
                        )
                    }
                })
            default:
                completion(false)
                print("\(res.response?.statusCode)asdf")
            }
        })
        //            .publishData()
        //            .compactMap { $0.response }
        //            .sink(receiveValue: { [unowned self] value in
        //                switch value.statusCode {
        //                case 200:
        //                    httpClient.post(
        //                        url: UserAPI.login.path(),
        //                        params: [
        //                            "user_id": value.value(forKey: "id")!
        //                        ],
        //                        header: ["Content-Type": "application/json"]
        //                    )
        //                        .publishData()
        //                        .compactMap{ $0.response }
        //                        .sink(receiveValue: { value in
        //                            switch value.statusCode {
        //                            case 200:
        //                                completion(true)
        //                                token = value.value(forKey: "access_token") as! String
        //                            default:
        //                                completion(false)
        //                            }
        //                        }).store(in: &subscription)
        //                default:
        //                    completion(false)
        //                    print(value)
        //                }
        //            }).store(in: &subscription)
        
        
    }
}
