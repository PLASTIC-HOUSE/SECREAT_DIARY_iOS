//
//  SecretDiaryApp.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/12.
//

import SwiftUI

@main
struct SecretDiaryApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                DiaryListView()
                    .environmentObject(authentication)
            } else {
                ContentView()
                    .environmentObject(authentication)
            }
        }
    }
}
