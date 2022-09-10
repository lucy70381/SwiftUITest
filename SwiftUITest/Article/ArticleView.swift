//
//  ArticleView.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/22.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Article
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text(article.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("By \(article.author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                })
            }
                    
            Group {
                HStack(spacing: 3) {
                    ForEach(0..<article.rating) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                Text(article.excerpt)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        ArticleView(article: articles[0])
    }
}
