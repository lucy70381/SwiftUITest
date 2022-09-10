//
//  SwiftUIAnimation.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/12.
//

import SwiftUI

struct SwiftUIAnimation: View {
    
    
    
    var body: some View {
        VStack {
            implicitAnimation()
            explicitAnimation()
        }
    }
}

struct SwiftUIAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimation()
    }
}

//隱式動畫
struct implicitAnimation: View {
    
    @State var heartIsClicked = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(heartIsClicked ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartIsClicked ? .red: .white)
                .font(.system(size: 100))
                .scaleEffect(heartIsClicked ? 1 : 0.5)
        }
        //        .animation(.default)
        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
        .onTapGesture {
            self.heartIsClicked.toggle()
        }
    }
}

//顯式動畫 (可以從 withAnimation 排除該行程式碼
struct explicitAnimation: View {
    
    @State var circleColorChanged = false
    @State var heartColorChanged = false
    @State var heartSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red: .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1 : 0.5)
        }
        .onTapGesture {
            withAnimation(.default) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
            }
            
            self.heartSizeChanged.toggle()
        }
    }
}
