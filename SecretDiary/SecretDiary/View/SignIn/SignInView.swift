//
//  SignIn.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/05/12.
//

import SwiftUI

struct SignInView: View {
    @State private var lines = [Line]()
    @State private var count = 1
    @State private var isActive = false
    @State private var showAlert = false
    
    @ObservedObject private var viewModel = SignInViewModel()
    
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        
        ZStack {
            Image("BackgroundImage2")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                Text("Sign to Sign In")
                    .font(.system(size: 30, weight: .medium))
                
                canvasView
                    .border(Color.black, width: 3)
                
                Button("로그인", action: {
                    let image = canvasView.snapshot()
                    
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    
                    viewModel.signIn(image: image) { success in
                        if success {
                            authentication.updateValidation(success: true)
                        } else {
                            showAlert = true
                        }
                    }
                }).font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 21)
                    .alert("로그인 실패", isPresented: $showAlert) {
                        Button("Cancel", role: .cancel) {}
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
        .background()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
