//
//  SwiftUITransition2.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/14.
//

import SwiftUI

struct SwiftUITransition2: View {
    
    @State private var index = 0
    @State private var ratio = 0.0
    @State private var changing = false
    
    var list = [
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng", rating: 4, excerpt: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier."),
        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos", rating: 5, excerpt: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls."),
        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan", rating: 4, excerpt: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial."),
        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati", rating: 5, excerpt: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps.")
    ]
    
    var body: some View {
        
        VStack {
            
            if !changing {
                list[index]
                    .transition(.scaleDownAndUp)
            }
            
            if changing {
                list[index]
                    .transition(.scaleDownAndUp)
            }
        }
        .onTapGesture {
            self.index = (self.index + 1) % list.count
            withAnimation(.spring()) {
                changing.toggle()
            }
        }
        
    }
}

struct SwiftUITransition2_Previews: PreviewProvider {
    static var previews: some View {
        
        
        
        SwiftUITransition2()
    }
}

extension AnyTransition {
    static var scaleDownAndUp: AnyTransition {
        AnyTransition.offset(y: 600).combined(with: .scale(scale: 0, anchor: .bottom)).combined(with: .opacity)
    }
    
    static var slideInAndOut: AnyTransition {
        AnyTransition.asymmetric(
            insertion: AnyTransition.offset(x: 800).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .trailing)),
            removal: AnyTransition.offset(x: -800).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .leading))
        )
    }

}
