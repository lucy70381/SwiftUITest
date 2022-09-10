//
//  ContentView.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/6.
//

import SwiftUI

struct SwiftUIStack2: View {
    var body: some View {
        VStack {
            
            VStack(spacing: -50) {
                PricingView2(title: "Team", price: "$299", textColor: .white, bgColor: .black, iconName: "wand.and.rays")
                    .scaleEffect(0.8)
                    .zIndex(3)
                PricingView2(title: "Pro", price: "$19", textColor: .white, bgColor: .yellow, iconName: "dial.min")
                    .scaleEffect(0.85)
                    .zIndex(2)
                PricingView2(title: "Basic", price: "$9", textColor: .white, bgColor: .purple, iconName: "seal.fill")
                    .scaleEffect(0.9)
                    .zIndex(1)
            }
            Spacer()
        }
    }
}

struct SwiftUIStack2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStack2()
    }
}

struct PricingView2: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var iconName: String?
    
    
    var body: some View {
        VStack {
            if iconName != nil {
                Image(systemName: iconName!)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
            
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
