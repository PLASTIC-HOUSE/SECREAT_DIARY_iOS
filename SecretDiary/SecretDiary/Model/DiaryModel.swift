//
//  DiaryModel.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation

struct DiaryList: Codable {
    var diaries : [Diaries]?
}

struct Diaries: Codable, Hashable {
    var id: Int
    var title: String
}

struct DiaryDetail: Codable {
    var content = String()
    var created_at = String()
    var title = String()
}

struct Token: Codable {
    var access_token = String()
}

struct LoginId: Codable {
    var id = Int()
}
