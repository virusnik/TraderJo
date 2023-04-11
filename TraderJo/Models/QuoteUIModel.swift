//
//  QuoteUIModel.swift
//  TraderJo
//
//  Created by Sergio Veliz on 11.04.2023.
//

import Foundation

class QuoteUIModel: Identifiable {
    enum State {
        case positive
        case negative
        case up
        case down
    }
    var quote: QuoteInfo
    var state: State
    
    init(quote: QuoteInfo, state: State) {
        self.quote = quote
        self.state = state
    }
}
