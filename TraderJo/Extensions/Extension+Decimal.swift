//
//  Extension+Decimal.swift
//  TraderJo
//
//  Created by Sergio Veliz on 11.04.2023.
//

import Foundation

extension Decimal {
    var withFormat: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        return formatter.string(for: self) ?? String(describing: self)
    }
    
    var withFormatPlusSign: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        formatter.positivePrefix = formatter.plusSign
        return formatter.string(for: self) ?? String(describing: self)
    }
}
