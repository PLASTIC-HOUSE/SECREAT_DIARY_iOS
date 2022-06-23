//
//  ContentView.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundImage")
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("비밀일기장")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(Color.init(uiColor: .textColor1!))
                        .padding(.top, 130)
                        .padding(.bottom, 370)
                    NavigationLink(destination: SignInView()) {
                        Text("로그인하러 가기")
                            .foregroundColor(Color.init(uiColor: .textColor1!))
                            .font(.system(size: 16, weight: .medium))
                    }
                    .frame(width: 300, height: 45, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(uiColor: .boxBackgroundColor!))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.init(uiColor: .authStrokeColor!), lineWidth: 10)
                            )
                    )
                    .padding(.bottom, 25)
                    .navigationBarHidden(true)
                    
                    NavigationLink(destination: WriteNickNameView()) {
                        Text("회원가입하러 가기")
                            .foregroundColor(Color.init(uiColor: .textColor1!))
                            .font(.system(size: 16, weight: .medium))
                    }
                    .frame(width: 300, height: 45, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(uiColor: .boxBackgroundColor!))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.init(uiColor: .authStrokeColor!), lineWidth: 10)
                            )
                    )
                    
                    .navigationBarHidden(true)
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
