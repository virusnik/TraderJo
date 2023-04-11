//
//  QuoteInfo.swift
//  TraderJo
//
//  Created by Sergio Veliz on 03.04.2023.
//

import Foundation

struct QuoteInfo: Decodable {
    // ticker
    let c: String
    // lastPrice
    var ltr: String?
    // latins name
    var name2: String?
    // change percents
    var pcp: Decimal?
    // last transaction price
    var ltp: Decimal?
    // change price last transaction in points
    var chg: Decimal?
}
