//
//  SwiftUIShape.swift
//  SwiftUITest
//
//  Created by 楊惠如 on 2021/4/12.
//

import SwiftUI

struct SwiftUIShape: View {
    var body: some View {
        VStack {
            fillColorRectangle()
            strokeRectangle()
            
        }
    }
}

struct SwiftUIShape_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShape()
    }
}

struct fillColorRectangle: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
        }
        .fill(Color.green)
    }
}

struct strokeRectangle: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            //將點與起點連接起來
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 10)
    }
}
