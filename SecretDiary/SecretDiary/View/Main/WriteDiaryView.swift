//
//  WriteDiaryView.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/19.
//

import SwiftUI

struct WriteDiaryView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var showAlert = false
    @FocusState private var nameIsFocused: Bool
    
    @ObservedObject private var viewModel = PostDiaryViewModel()
    
    var body: some View {
        ZStack {
            Color.init(uiColor: .listBackgroundColor!)
                .ignoresSafeArea()
            
            Image("Clouds")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                TextField("제목을 입력하세요", text: $title)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 300, height: 65, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    //.background(Color.init(uiColor: .boxBackgroundColor!))
                    .focused($nameIsFocused)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.init(uiColor: .writingStrokeColor!), lineWidth: 3)
                    )
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(uiColor: .boxBackgroundColor!)))
                    .padding(.bottom, 10)
                    
                
                TextEditor(text: $content)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 340, height: 240, alignment: .center)
                    //.background(Color.init(uiColor: .boxBackgroundColor!))
                    .focused($nameIsFocused)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.init(uiColor: .writingStrokeColor!), lineWidth: 3)
                    )
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(uiColor: .boxBackgroundColor!)))
                
                Button("일기 작성하기", action: {
                    nameIsFocused = false
                    viewModel.postDiary(content: content, title: title) { success in
                        if success {
                            showAlert = true
                        }
                    }
                })
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(uiColor: .writingBackgroundColor!)))
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    .alert("작성이 완료되었습니다.", isPresented: $showAlert) {
                        Button("Cancel", role: .cancel) {
                            NavigationUtil.popToRootView()
                        }
                    }
                    
                
            }
        }
    }
}

struct WriteDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        WriteDiaryView()
    }
}
