//
//  DiaryDetailViewModel.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation
import Combine
import Alamofire

class DiaryDetailViewModel: ObservableObject {
    @Published var diaryDetail = DiaryDetail()
    
    func getDiaryDetail(id: Int) {
        HTTPClient()
            .get(url: DiaryAPI.getDetail(id).path(), params: nil)
            .responseData(completionHandler: {[unowned self] res in
                switch res.response?.statusCode {
                case 200:
                    let model = try? JSONDecoder().decode(DiaryDetail.self, from: res.data!)
                    diaryDetail = model!
                default:
                    print(res.error ?? "")
                }
            })
    }
}
