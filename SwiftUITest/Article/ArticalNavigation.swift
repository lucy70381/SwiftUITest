//
//  ArticalNavigation.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/22.
//

import SwiftUI

struct ArticalNavigation: View {
    
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ZStack {
                    ArticleView(article: article)
                        .onTapGesture {
                            selectedArticle = article
                        }
                    
                    //Navigation轉頁
//                    NavigationLink(destination: ArticleDetail(article: article)) {
//                    }
//                    .hidden()
                }
            }
            //卡片 modal
            .sheet(item: $selectedArticle, content: { article in
                    ArticleDetail(article: article)
                }
            )
            //全螢幕強制回應視圖
//            .fullScreenCover(item: $selectedArticle, content: { article in
//                ArticleDetail(article: article)
//
//            })
            .navigationBarTitle("Your Reading")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ArticalNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ArticalNavigation()
    }
}
