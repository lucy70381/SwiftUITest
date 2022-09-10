//
//  SwiftUIForm.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/26.
//

import SwiftUI

struct SwiftUIForm: View {
    
    @State private var restaurantsState = restaurants
    
    var body: some View {
        NavigationView {
            List(restaurantsState.indices) { index in
                BasicImageRow2(restaurant: restaurantsState[index])
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            restaurantsState[index].isCheckIn.toggle()
                        }, label: {
                            Text("Check-in")
                            Image(systemName: "checkmark.seal.fill")
                        })
                        
                        Button(action: {
                            restaurantsState.remove(at: index)
                        }, label: {
                            Text("Delete")
                            Image(systemName: "trash")
                        })
                        
                        Button(action: {
                            restaurantsState[index].isFavorite.toggle()
                        }, label: {
                            Text("Favorite")
                            Image(systemName: "star")
                        })
                    }))
            }
            .navigationBarTitle("Restaurants")
        }
    }
}

struct SwiftUIForm_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForm()
    }
}

struct BasicImageRow2: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Image(restaurant.image)
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
            
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                HStack {
                    Text(restaurant.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    Text(String(repeating: "$", count: restaurant.priceLevel))
                        .foregroundColor(.secondary)
                    
                }
                Text(restaurant.type)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.secondary)
                Text(restaurant.phone)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            })
            Spacer()
            if restaurant.isCheckIn == true {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite == true {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        })
    }
}
