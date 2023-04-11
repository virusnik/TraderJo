//
//  ScrollContentBackgroundModifier.swift
//  TraderJo
//
//  Created by Sergio Veliz on 11.04.2023.
//

import SwiftUI

struct ScrollContentBackgroundModifier: ViewModifier {
    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}



