//
//  SwiftUINavigation.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/19.
//

import SwiftUI

struct SwiftUINavigation: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().tintColor = .black

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants, id: \.name) { restaurant in
                    NavigationLink(destination: RestaurantDetail(restaurant: restaurant)) {
                        BasicImageRow2(restaurant: restaurant)
                    }
                }
            }
            .navigationBarTitle("Restaurants", displayMode: .automatic)
//            .navigationBarHidden(true)
        }
    }
}

struct SwiftUINavigation_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigation()
    }
}
