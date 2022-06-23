//
//  UserAPI.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation

enum UserAPI: API {
    case signUp
    case login
    case postImg
    
    func path() -> String {
        switch self {
        case .signUp:
            return springURL + "/user"
            
        case .login:
            return springURL + "/auth"
            
        case .postImg:
            return pythonURL + "/login"
        }
    }
}
