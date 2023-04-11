//
//  TextWithPadding.swift
//  TraderJo
//
//  Created by Sergio Veliz on 11.04.2023.
//

import SwiftUI

struct TextWithPadding: ViewModifier {
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .font(.fourteenMedium)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}
