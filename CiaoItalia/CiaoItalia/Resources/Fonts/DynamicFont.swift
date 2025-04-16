//
//  DynamicFont.swift
//  CiaoItalia
//
//  Created by mih on 10/04/25.
//

import Foundation
import UIKit

protocol DynamicFont {
    func fontName() -> String
    func fontSize(style: UIFont.TextStyle) -> CGFloat
}

enum FuzzyBubbles: DynamicFont {
    case bold

    func fontName() -> String {
        switch self {
        case .bold: return "FuzzyBubbles-Bold"
        }
    }

    func fontSize(style: UIFont.TextStyle) -> CGFloat {
        switch style {
        case .extraLargeTitle: return 48.0
        case .largeTitle: return 34.0
        case .title1: return 28.0
        case .title2: return 22.0
        case .title3: return 20.0
        case .headline: return 18.0
        case .body: return 17.0
        case .callout: return 16.0
        case .subheadline: return 15.0
        case .footnote: return 13.0
        case .caption1: return 12.0
        case .caption2: return 11.0
        default: return 17.0
        }
    }
}
