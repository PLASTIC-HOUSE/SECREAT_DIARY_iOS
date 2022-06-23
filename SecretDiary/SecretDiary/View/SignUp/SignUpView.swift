//
//  SignUpView.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/19.
//

import SwiftUI

struct SignUpView: View {
    @State private var lines = [Line]()
    @State private var count = 1
    @State private var showAlert = false
    
    @State private var data = [UIImage]()
    
    @ObservedObject private var viewModel = SignUpViewModel()
    
    var nickname = String()
    
    var body: some View {
        
        ZStack {
            Image("BackgroundImage2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Sign to Sign Up")
                    .font(.system(size: 30, weight: .medium))
                
                Text("\(count)/5")
                    .font(.system(size: 25, weight: .heavy))
                    .padding(5)
                
                canvasView
                    .border(Color.black, width: 3)
                
                Button("다음") {
                    let image = canvasView.snapshot()
                    
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    
                    data.append(image)
                    
                    if count == 5 {
                        viewModel.signUp(images: data, nickname: nickname) { success in
                            if success {
                                showAlert = true
                            }
                        }
                    } else {
                        count += 1
                        lines.removeAll()
                    }
                    
                    
                    
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 21)
                .alert("회원가입이 완료되었습니다.", isPresented: $showAlert) {
                    Button("Cancel", role: .cancel) {
                        NavigationUtil.popToRootView()
                    }
                }
                
            }
            .padding(.bottom, 100)
        }
        
    }
    
    var canvasView: some View {
        Canvas { context, size in
            for line in lines {
                
                var path = Path()
                path.addLines(line.points)
                
                context.stroke(path, with: .color(.black), style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
            }
        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
            let newPoint = value.location
            if value.translation.width + value.translation.height == 0 {
                lines.append(Line(points: [newPoint]))
            } else {
                let index = lines.count - 1
                lines[index].points.append(newPoint)
            }
            
        }).onEnded({ value in
            if let last = lines.last?.points, last.isEmpty {
                lines.removeLast()
            }
        })
        )
            .frame(width: 300, height: 200, alignment: .center)
            .background(.white)
    }
}


struct Line: Identifiable {
    
    var points: [CGPoint]
    
    let id = UUID()
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
