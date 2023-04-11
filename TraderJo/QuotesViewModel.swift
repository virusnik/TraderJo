//
//  QuotesViewModel.swift
//  TraderJo
//
//  Created by Sergio Veliz on 08.04.2023.
//

import Foundation

class QuotesViewModel: ObservableObject {
    
    private let service: QuotesServiceProtocol
    
    let tickersToWatchChanges = ["RSTI","GAZP","MRKZ","RUAL","HYDR","MRKS","SBER","FEES","TGKA",
                                 "VTBR","ANH.US","VICL.US","BURG.US","NBL.US","YETI.US","WSFS.US",
                                 "NIO.US","DXC.US","MIC.US","HSBC.US","EXPN.EU","GSK.EU","SHP.EU",
                                 "MAN.EU","DB1.EU","MUV2.EU","TATE.EU","KGF.EU","MGGT.EU","SGGD.EU"]
    
    @Published var quoteModels: [QuoteUIModel]
    
    
    init(service: QuotesServiceProtocol) {
        self.service = service
        
        let quoteModels = tickersToWatchChanges.map {
            QuoteUIModel(quote: QuoteInfo(c: $0, ltr: "", name2: "", pcp: 0, ltp: 0, chg: 0), state: .positive)
        }
        
        self.quoteModels = quoteModels
    }
    
    
    func subscribeForQuotes() {
        service.subscribeForQuotes(tickers: tickersToWatchChanges) { [weak self] quote in
            self?.didQuoteChange(quote: quote)
        }
    }
    
    private func didQuoteChange(quote: QuoteInfo) {
        if let index = self.quoteModels.firstIndex(where: { $0.quote.c == quote.c }) {
            let currentQuoteModel = self.quoteModels[index]
            
            if let exchange = quote.ltr, let name = quote.name2 {
                currentQuoteModel.quote.ltr = exchange
                currentQuoteModel.quote.name2 = name
            }
            
            if let currentPercentChange = currentQuoteModel.quote.pcp {
                if let newPercentChange = quote.pcp {
                    if newPercentChange == currentPercentChange {
                        currentQuoteModel.state = currentPercentChange >= 0 ? .positive : .negative
                    } else {
                        currentQuoteModel.state = newPercentChange > currentPercentChange ? .up : .down
                    }
                    currentQuoteModel.quote.pcp = newPercentChange
                }
            }
            
            if let latestPrice = quote.ltp, let latestPriceChange = quote.chg {
                currentQuoteModel.quote.ltp = latestPrice
                currentQuoteModel.quote.chg = latestPriceChange
            }
            
            objectWillChange.send()
            
        }
    }
}



