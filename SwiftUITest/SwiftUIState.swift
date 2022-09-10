//
//  SwiftUIState.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/12.
//

import SwiftUI

struct SwiftUIState: View {
    
    
    @State private var total = 0
    @State private var blueCounter = 0
    @State private var greenCounter = 0
    @State private var redCounter = 0
    
    var body: some View {
        VStack {
            isPlayingButton()
            Text("\(blueCounter + greenCounter + redCounter)")
                .font(.system(size: 150))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                countButton(count: $blueCounter, color: .blue)
                countButton(count: $greenCounter, color: .green)
                countButton(count: $redCounter, color: .red)
            }
        }
    }
}

struct SwiftUIState_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIState()
    }
}

struct isPlayingButton: View {
    
    @State private var isPlaying = false
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }, label: {
            Image(systemName: "play.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(isPlaying ? .red : .green)
        })
    }
}

struct countButton: View {
        
    @Binding var count: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            
            self.count += 1
        }, label: {
            Text("\(count)")
                .foregroundColor(.white)
                .font(.system(size: 60))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(color)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        })
    }
}
