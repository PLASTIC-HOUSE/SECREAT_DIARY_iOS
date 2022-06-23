//
//  Authentication.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/23.
//

import Foundation
import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
