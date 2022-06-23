//
//  PostDiaryViewModel.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation
import Combine
import Alamofire

class PostDiaryViewModel: ObservableObject {
    
    func postDiary(content: String, title: String, completion: @escaping (Bool) -> Void) {
        HTTPClient()
            .post(url: DiaryAPI.postLetter.path(), params: ["content": content, "title": title], header: ["Content-Type": "application/json", "Authorization": "Bearer " + token])
            .responseData(completionHandler: {[unowned self] res in
                switch res.response?.statusCode {
                case 201:
                    completion(true)
                default:
                    completion(false)
                    print(res.response?.statusCode)
                }
            })
    }
}
