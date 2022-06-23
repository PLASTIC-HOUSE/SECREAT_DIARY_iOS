//
//  DiaryRowView.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/19.
//

import SwiftUI

struct DiaryRowView: View {
    var title: String = ""
    
    @ObservedObject var viewModel = DiaryDetailViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.init(uiColor: .authStrokeColor!), lineWidth: 5)
                .background(Color.init(uiColor: .boxBackgroundColor!))
                .cornerRadius(10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding()
                
                Spacer()
            }
        }
        .frame(width: 300, height: 65, alignment: .center)
    }
}

struct DiaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRowView().previewLayout(.sizeThatFits)
    }
}
