//
//  SwiftUITrasition.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/12.
//

import SwiftUI

struct SwiftUITransition: View {
    
    @State private var processing = false
    @State private var isSubmit = false
    @State private var running = false
    
    var body: some View {
        VStack {
            buttonTransition()
            
            ZStack {
                RoundedRectangle(cornerRadius: 70.0)
                    .frame(width: processing || isSubmit ? 270 : 250, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(isSubmit ? .red : .green)
                
                        
                if !(processing || isSubmit) {
                    Text("Submit")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .transition(.move(edge: .top))
                        .animation(.spring())
                        
                } else {
                    HStack(spacing: 10) {
                        if processing {
                            Circle()
                                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.8)
                                .stroke(Color.white, lineWidth: 5)
                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .rotationEffect(Angle(degrees: running ? 360 : 0))
                                .animation(Animation.linear.repeatForever(autoreverses: false))
                                .onAppear() {
                                    self.running.toggle()
                                }
                        }
                        
                        Text(isSubmit ? "Done" : "Processing")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
            .onTapGesture {
                withAnimation(Animation.spring()) {
                    self.processing.toggle()
                    
                    //延遲四秒執行
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                        self.processing.toggle()
                        self.running.toggle()
                        self.isSubmit.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            self.isSubmit.toggle()
                        })
                    })
                }
            }
            transitionAnimation()
        }
    }
}

struct SwiftUITrasition_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITransition()
    }
}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}

struct buttonTransition: View {
    
    @State var isActive = false
    @State var recording = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: isActive ? 60 : 10)
                .frame(width: isActive ? 60 : 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(isActive ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(isActive ? Color.red : Color.green)
                        .scaleEffect(recording ? 1 : 0.7)
                )
            
            RoundedRectangle(cornerRadius: 10)
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: isActive ? 0.0001 : 1)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: isActive ? 70 : 260, height: 70)
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                isActive.toggle()
            }
            
            withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                recording.toggle()
            }
        }
    }
}


struct transitionAnimation: View {
    
    
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.green)
                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    Text("Show details")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.show.toggle()
                    }
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.purple)
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Text("Well, here is the details")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundColor(.white)
                    )
                    //                        .transition(.scale(scale: 0, anchor: .bottom))
                    //                        .transition(.offset(x: -600, y: 0))
                    .transition(AnyTransition.offsetScaleOpacity)
            }
            
        }
    }
}
