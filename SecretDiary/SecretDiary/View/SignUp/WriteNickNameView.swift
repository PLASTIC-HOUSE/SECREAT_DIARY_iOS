//
//  WriteNickName.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/12.
//

import SwiftUI

struct WriteNickNameView: View {
    
    @State private var nickname = ""
    @State var isLinkActive = false
    
    var body: some View {
        
        ZStack {
            Image("BackgroundImage2")
                .ignoresSafeArea()
            
            VStack {
                Text("Nickname")
                    .font(.system(size: 30, weight: .medium))
                
                TextField("", text: $nickname)
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.white)
                    .border(.black, width: 3)
                
                NavigationLink(destination: SignUpView(nickname: nickname), label:  {
                    Text("다음")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                })
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom, 100)
            }
        }
    }
}

struct WriteNickName_Previews: PreviewProvider {
    static var previews: some View {
        WriteNickNameView()
    }
}
