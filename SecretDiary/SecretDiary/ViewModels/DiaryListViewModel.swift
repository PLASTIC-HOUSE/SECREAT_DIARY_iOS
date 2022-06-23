//
//  DiaryListViewModel.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation
import Combine
import Alamofire

class DiaryListViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var diary = [Diaries]()
    
    init() {
        getDiaryList()
    }
    
    func getDiaryList(){
        HTTPClient()
            .get(url: DiaryAPI.getLetter.path(), params: nil)
            .publishDecodable(type: DiaryList.self)
            .compactMap{ $0 }
            .sink(receiveValue: { res in
                switch res.response?.statusCode {
                case 200:
                    self.diary = res.value?.diaries ?? []
                default:
                    print(res.error)
                }
            }).store(in: &subscription)
    }
}
