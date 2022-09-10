//
//  RestaurantDetail.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/20.
//

import SwiftUI

struct RestaurantDetail: View {
    @Environment(\.presentationMode) var mode
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                .foregroundColor(.red)
        }))
        
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct RestaurantDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetail(restaurant: restaurants[0])
    }
}
