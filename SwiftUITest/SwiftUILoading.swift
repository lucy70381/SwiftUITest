//
//  SwiftUILoading.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/12.
//

import SwiftUI

struct SwiftUILoading: View {
   
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                circleLoading1()
                circleLoading2()
            }
            rectangleLoading()
            progressLoading()
            
            pointLoading()
        }
    }
}

struct SwiftUILoading_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILoading()
    }
}

struct circleLoading1: View {
    
    @State var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            //            .animation(Animation.default.repeatForever(autoreverses: false))
            
            //線性 越轉越慢
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}

struct circleLoading2: View {
    
    @State var isLoading = false
    
    var body: some View {
        ZStack() {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
    }
}

struct rectangleLoading: View {
    
    @State var isLoading = false
    
    var body: some View {
        ZStack() {
            Text("Loading")
                .bold()
                .font(.system(.body, design: .rounded))
                .offset(x: 0, y: -20)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3, alignment: .center)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}

struct progressLoading: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack() {
            Text("\(Int(progress * 100))%")
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 5)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: progress)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                .rotationEffect(Angle(degrees: -90))
            
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
                self.progress += 0.05
                if self.progress >= 1.0 {
                    timer.invalidate()
                }
            })
        }
    }
}

struct pointLoading: View {
    
    @State var isLoading = false
    
    var body: some View {
        HStack() {
            ForEach(0...4, id: \.self, content: {
                index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .scaleEffect(isLoading ? 0 : 1)
                    .animation(Animation.linear(duration: 0.6).repeatForever().delay(Double(index) * 0.2))
                
            })
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}
