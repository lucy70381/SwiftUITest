//
//  SwiftUIList.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/15.
//

import SwiftUI

struct SwiftUIList: View {
    var body: some View {
//        List (restaurants, id: \.name) { restaurant in
//            FullImageRow(restaurant: restaurant)
//            BasicImageRow(restaurant: restaurant)
//        }
        List(restaurants.indices) { index in

            if (0...1).contains(index) {
                FullImageRow(restaurant: restaurants[index])
            } else {
                BasicImageRow2(restaurant: restaurants[index])
            }

        }
    }
}

struct SwiftUIList_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIList()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant

    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )

            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
