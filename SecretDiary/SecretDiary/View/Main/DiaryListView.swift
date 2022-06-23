//
//  DiaryListView.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/19.
//

import SwiftUI
import Alamofire

struct DiaryListView: View {
    private let httpClient = HTTPClient()
    
    @EnvironmentObject var authentication: Authentication
    @ObservedObject var viewModel = DiaryListViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.init(uiColor: .listBackgroundColor!)
                    .ignoresSafeArea()
                
                Image("Clouds")
                    .resizable()
                    .ignoresSafeArea()
                
                List(viewModel.diary, id: \.self) { data in
                    NavigationLink(destination: DiaryDetailView(listId: data.id)) {
                        DiaryRowView(title: data.title)
                    }
                    .background(.clear)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.getDiaryList()
                }
            }
            .navigationTitle("콩순이의 일기장")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: .writingBackgroundColor, titleColor: .black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    NavigationLink(destination: WriteDiaryView()){
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 18, height: 18, alignment: .center)
                            .foregroundColor(.black)
                    }
                })
            }
        }
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView()
    }
}
