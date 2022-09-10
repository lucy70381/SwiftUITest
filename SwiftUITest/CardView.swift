//
//  CardView.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/8.
//

import SwiftUI

struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    var rating: Int
    var excerpt: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("Written by \(author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                })
            }
            .padding([.horizontal, .top])
                    
            Group {
                HStack(spacing: 3) {
                    ForEach(0..<rating) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                Text(excerpt)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.secondary)
            }
            .padding([.horizontal, .bottom])
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack() {
            verticalList()    //垂直
//            horizontalList()  //水平
        }
    }
}

struct ScrollViewHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("MONDAY, AUG 20")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("Your Reading")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding([.top, .horizontal])
    }
}

struct verticalList: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            ScrollViewHeader()
            VStack {
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng", rating: 4, excerpt: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier.")
                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos", rating: 5, excerpt: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.")
                CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan", rating: 4, excerpt: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial.")
                CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati", rating: 5, excerpt: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps.")
            }
        })
    }
}

struct horizontalList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            ScrollViewHeader()
            HStack {
                Group {
                    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng", rating: 4, excerpt: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier.")
                    CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos", rating: 5, excerpt: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.")
                    CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan", rating: 4, excerpt: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial.")
                    CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati", rating: 5, excerpt: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps.")
                }
                .frame(width: 300)
            }
        })
    }
}
