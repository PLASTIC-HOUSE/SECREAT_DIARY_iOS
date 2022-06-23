//
//  DiaryDetailView.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/19.
//

import SwiftUI

struct DiaryDetailView: View {
    
    var listId: Int
    
//    @State private var title: String = ""
    @State private var content: String = ""
//
//
    @ObservedObject var viewModel = DiaryDetailViewModel()
    
    var body: some View {
        ZStack {
            Color.init(uiColor: .listBackgroundColor!)
                .ignoresSafeArea()
            
            Image("Clouds")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(viewModel.diaryDetail.title)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 300, height: 65, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.init(uiColor: .writingStrokeColor!), lineWidth: 3)
                    )
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(uiColor: .boxBackgroundColor!)))
                    .padding(.bottom, 10)
                    
                
                Text(viewModel.diaryDetail.content)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 340, height: 440, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.init(uiColor: .writingStrokeColor!), lineWidth: 3)
                    )
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(uiColor: .boxBackgroundColor!)))
                
            }.onAppear {
                viewModel.getDiaryDetail(id: listId)
            }
        }
    }
}
