//
//  Extension+Font.swift
//  TraderJo
//
//  Created by Sergio Veliz on 10.04.2023.
//

import SwiftUI

extension Font {
    enum InterFont {
        case thin
        case extraLight
        case light
        case regular
        case medium
        case semiBold
        case bold
        case extraBold
        case black
        case custom(String)
        
        var value: String {
            switch self {
            case .thin:
                return "Inter-Regular_Thin"
            case .extraLight:
                return "Inter-Regular_ExtraLight"
            case .light:
                return "Inter-Regular_Light"
            case .regular:
                return "Inter-Regular"
            case .medium:
                return "Inter-Regular_Medium"
            case .semiBold:
                return "Inter-Regular_SemiBold"
            case .bold:
                return "Inter-Regular_Bold"
            case .extraBold:
                return "Inter-Regular_ExtraBold"
            case .black:
                return "Inter-Regular_Black"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func inter(_ type: InterFont, size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var fourteenRegular: Font {
        return Font.inter(.regular, size: 14)
    }
    
    static var fourteenBold: Font {
        return Font.inter(.bold, size: 14)
    }
    
    static var sixteenRegular: Font {
        return Font.inter(.regular, size: 16)
    }
    
    static var eighteenMedium: Font {
        return Font.inter(.medium, size: 18)
    }
    
    static var fourteenMedium: Font {
        return Font.inter(.medium, size: 14)
    }
    
    static var twentyOneMedium: Font {
        return Font.inter(.medium, size: 21)
    }
    
    static var twentyOneBold: Font {
        return Font.inter(.semiBold, size: 21)
    }
    
    static var thirtySixBold: Font {
        return Font.inter(.bold, size: 36)
    }
}
