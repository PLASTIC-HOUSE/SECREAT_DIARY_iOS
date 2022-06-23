//
//  HTTPClient.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/16.
//

import Foundation
import Alamofire

let springURL = "http://secret-diary.kro.kr"
let pythonURL = "https://secretdiary-fastapi.herokuapp.com"
var token = ""

protocol HTTPClientProvider {
    func get(url: String, params: Parameters?) -> DataRequest
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
}

class HTTPClient: HTTPClientProvider {
    func get(url: String, params: Parameters?) -> DataRequest {
        AF.request( url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json", "Authorization": "Bearer " + token],
                   interceptor: nil)
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.prettyPrinted,
                   headers: header,
                   interceptor: nil)
    }
}
