//
//  QuotesService.swift
//  TraderJo
//
//  Created by Sergio Veliz on 11.04.2023.
//

import Foundation

protocol QuotesServiceProtocol: AnyObject {
    func subscribeForQuotes(tickers: [String], callback: @escaping (QuoteInfo) -> ())
}

final class QuotesService: QuotesServiceProtocol {
    
    private let request = URLRequest(url: URL(string: "wss://wss.tradernet.ru")!)
    private lazy var socketClient: SocketServiceProtocol = SocketService(request: request)
    
    func subscribeForQuotes(tickers: [String], callback: @escaping (QuoteInfo) -> ()) {
        guard
            let quotesJSONData = try? JSONSerialization.data(
                withJSONObject: tickers
            ),
            let quotesJSONString = String(
                data: quotesJSONData,
                encoding: .utf8
            )
        else {
            return
        }
        
        let string = "[\"realtimeQuotes\", \(quotesJSONString)]"
        
        socketClient.subscribe(type: QuoteInfo.self, write: string) { quote in
            callback(quote)
        }
    }
}
