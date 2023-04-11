//
//  TextWithBackground.swift
//  TraderJo
//
//  Created by Sergio Veliz on 11.04.2023.
//

import SwiftUI

struct TextWithBackground: View {
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color?
    
    
    var body: some View {
        Text(text)
            .modifier(TextWithPadding())
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(15)
    }
}

struct TextWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        TextWithBackground(text: "text", backgroundColor: .black, foregroundColor: .blue)
    }
}
