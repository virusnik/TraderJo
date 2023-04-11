//
//  ContentView.swift
//  TraderJo
//
//  Created by Sergio Veliz on 03.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuotesViewModel(service: QuotesService())
    
    var body: some View {
        List(viewModel.quoteModels) { item in
            quoteCell(item)
        }
        .modifier(ScrollContentBackgroundModifier())
        .onAppear {
            viewModel.subscribeForQuotes()
        }
    }
    
    
    private func quoteCell(_ item: QuoteUIModel) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(item.quote.c)")
                    .padding([.bottom, .top], 5)
                    .font(.fourteenMedium)
                Text("\(item.quote.ltr ?? "") | \(item.quote.name2 ?? "")")
                    .font(.fourteenRegular)
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                switch item.state {
                case .negative:
                    TextWithBackground(text: "\(item.quote.pcp?.withFormatPlusSign ?? "")%", backgroundColor: .clear, foregroundColor: .red)
                case .positive:
                    TextWithBackground(text: "\(item.quote.pcp?.withFormatPlusSign ?? "")%", backgroundColor: .clear, foregroundColor: .green)
                case .down:
                    TextWithBackground(text: "\(item.quote.pcp?.withFormatPlusSign ?? "")%", backgroundColor: .red, foregroundColor: .black)
                case .up:
                    TextWithBackground(text: "\(item.quote.pcp?.withFormatPlusSign ?? "")%", backgroundColor: .green, foregroundColor: .black)
                }
                
                Text("\(item.quote.ltp?.withFormat ?? "") \(item.quote.chg?.withFormatPlusSign ?? "")").font(.fourteenMedium)
                
            }
        }
        .environment(\.defaultMinListRowHeight, 56)
        .listRowBackground(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
