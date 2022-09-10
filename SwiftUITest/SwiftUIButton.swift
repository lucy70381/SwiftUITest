//
//  SwiftUIButton.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/9.
//

import SwiftUI

struct SwiftUIButton: View {
    var body: some View {
        VStack {
            roundedButton()
            
            ImageButton()
            
            
            gradientShadowLabel(labelName: "shadowLabel", iconName: "trash")
            
            gradientShadowButton(buttonName: "Share", iconName: "square.and.arrow.up")
            gradientShadowButton(buttonName: "Edit", iconName: "square.and.pencil")
            gradientShadowButton(buttonName: "Delete", iconName: "trash")
            
            Button(action: {
                print("Plus button tapped!")
            }, label: {
                Image(systemName: "plus")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(40)
            })
            .buttonStyle(rotateButtonStyle())
        }
    }
}

struct rotateButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .rotationEffect(.degrees(configuration.isPressed ? 45 : 0))
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            //漸層 左 -> 右
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            //漸層 上-> 下
            //            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton()
    }
}


struct roundedButton: View {
    var body: some View {
        Button(action: {
            print("Hello")
        }, label: {
            Text("Hello World")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(40)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                )
            //                .border(Color.purple, width: 5)
        })
    }
}

struct ImageButton: View {
    var body: some View {
        Button(action: {
            print("Delete button tapped!")
        }, label: {
            HStack {
                Image(systemName: "trash")
                    .font(.title)
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
        })
    }
}

struct gradientShadowLabel: View {
    var labelName: String
    var iconName: String
    
    var body: some View {
        Label(
            title: {
                Text(labelName)
                    .fontWeight(.semibold)
                    .font(.title)
                
            },
            icon: { Image(systemName: iconName)
                .font(.title)
            }
        )
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        //漸層 左 -> 右
        .background(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
        //漸層 上-> 下
        //            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(40)
        .shadow(color: .gray, radius: 5, x: 5, y: 5)
        .padding(.horizontal, 20)
    }
}

struct gradientShadowButton: View {
    var buttonName: String
    var iconName: String
    
    var body: some View {
        Button(action: {
            print("\(buttonName) button tapped!")
        }, label: {
            HStack {
                Image(systemName: iconName)
                    .font(.title)
                Text(buttonName)
                    .fontWeight(.semibold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        })
        .buttonStyle(GradientBackgroundStyle())
    }
}
