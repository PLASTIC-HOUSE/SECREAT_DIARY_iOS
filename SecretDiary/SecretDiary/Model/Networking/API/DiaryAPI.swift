//
//  DiaryAPI.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation

enum DiaryAPI: API {
    case getLetter
    case postLetter
    case getDetail(_ id: Int)

    func path() -> String {
        switch self {
        case .getLetter, .postLetter:
            return springURL + "/diary"
            
        case .getDetail(let id):
            return springURL + "/diary/\(id)"
        }
    }
}
