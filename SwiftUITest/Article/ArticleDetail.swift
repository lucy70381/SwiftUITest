//
//  ArticleDetail.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/22.
//

import SwiftUI

struct ArticleDetail: View {
    @Environment(\.presentationMode) var mode
    var article: Article
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        HStack {
                            Spacer()
                            VStack {
                                Button(action: {
                                    showAlert = true
                                    
                                }, label: {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                })
                                .padding()
                                Spacer()
                            }
                        }
                    )
                
                
                VStack(alignment: .leading) {
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
                    
                    HStack(spacing: 3) {
                        ForEach(0..<article.rating) { item in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    Text(article.content)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal,8)
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Reminder"), message: Text("Are you sure you finish reading the article?"), primaryButton: .default(Text("Yes"), action: {
                mode.wrappedValue.dismiss()
            }), secondaryButton: .cancel(Text("No")))
        })
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
        }))
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: articles[0])
    }
}
